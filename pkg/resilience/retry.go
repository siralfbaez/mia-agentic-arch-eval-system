package resilience

import (
	"context"
	"time"
)

// Retry executes a function with exponential backoff
func Retry(ctx context.Context, attempts int, sleep time.Duration, f func() error) error {
	if err := f(); err != nil {
		if attempts--; attempts > 0 {
			// Add jitter to prevent "Thundering Herd" on USPS gateways
			time.Sleep(sleep)
			return Retry(ctx, attempts, 2*sleep, f)
		}
		return err
	}
	return nil
}