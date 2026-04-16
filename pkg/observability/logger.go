package observability

import (
	"context"
	"log/slog"
	"os"
)

type Logger struct {
	*slog.Logger
}

// NewUSPSLogger initializes a structured logger with USPS-required fields
func NewUSPSLogger() *Logger {
	handler := slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{
		AddSource: true, // Crucial for ARB technical audits
		Level:     slog.LevelInfo,
	})

	// Injecting global context like the Organization/System name
	logger := slog.New(handler).With(
		slog.String("org", "USPS"),
		slog.String("component", "Mia-Agentic-Engine"),
	)

	return &Logger{logger}
}

// AuditLog tracks AI decision-making specifically for compliance
func (l *Logger) AuditLog(ctx context.Context, agentID string, action string, status string) {
	l.InfoContext(ctx, "AI_AUDIT_TRAIL",
		slog.String("agent_id", agentID),
		slog.String("action", action),
		slog.String("status", status),
	)
}