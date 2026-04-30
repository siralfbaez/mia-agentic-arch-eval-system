# MIA – Multi-Agent Intelligence Architecture

## What MIA Does (Core Idea)

- **Ingests** stakeholder requirements and streaming telemetry from legacy/on-prem systems
- **Runs** them through an agentic brain to produce Architecture Assessments, Journey Maps, and CIO-ready PowerPoints
- **Enforces** NIST 800-53 compliance via specialized agents
- **Uses** a medallion architecture (Bronze → Gold) via Kafka/AlloyDB

---

## Original Stack

| Component | Technology |
|---|---|
| Orchestration Services | Go |
| Messaging / Streaming | Kafka / Confluent |
| AI / Agentic Brain | GCP Vertex AI |
| Database | AlloyDB |
| Infrastructure as Code | Terraform |
| Communication Protocol | gRPC / protobuf |

---

## Rebuilding with the Claude AI Engine

Rebuilding MIA with the Claude AI engine is very doable. Here's how the key pieces map over:

| Original | Claude-Powered Equivalent |
|---|---|
| Vertex AI agents | Claude API (`claude-sonnet-4`) as the agentic brain |
| Go orchestration services | Python (FastAPI or async scripts) |
| Prompt templates (`.tmpl`) | Claude system prompts + structured JSON output |
| NIST compliance agent | Claude with a RAG-style knowledge base |
| Cost optimizer agent | Claude with tool use / structured reasoning |
| Report generation | Claude → `.docx` / `.pptx` via file generation |