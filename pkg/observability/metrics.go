package observability

import (
	"time"
)

// TrackPerformance helps generate the KPI success metrics for the CIO briefings
func TrackPerformance(start time.Time, operation string) (string, float64) {
	elapsed := time.Since(start).Seconds()
	return operation, elapsed
}