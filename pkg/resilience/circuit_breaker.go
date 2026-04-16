package resilience

import (
	"errors"
	"sync"
	"time"
)

var ErrCircuitOpen = errors.New("circuit breaker is open - service unavailable")

type CircuitBreaker struct {
	mutex           sync.Mutex
	failureThreshold int
	failures         int
	lastFailureTime  time.Time
	state            string // "CLOSED", "OPEN"
}

func (cb *CircuitBreaker) Execute(f func() error) error {
	cb.mutex.Lock()
	if cb.state == "OPEN" {
		if time.Since(cb.lastFailureTime) > 30*time.Second {
			cb.state = "HALF-OPEN"
		} else {
			cb.mutex.Unlock()
			return ErrCircuitOpen
		}
	}
	cb.mutex.Unlock()

	err := f()

	cb.mutex.Lock()
	defer cb.mutex.Unlock()

	if err != nil {
		cb.failures++
		cb.lastFailureTime = time.Now()
		if cb.failures >= cb.failureThreshold {
			cb.state = "OPEN"
		}
		return err
	}

	cb.failures = 0
	cb.state = "CLOSED"
	return nil
}