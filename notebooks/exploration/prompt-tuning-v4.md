# Cell 1: Markdown - Project Overview

---

# Agentic Architecture Evaluation - Prompt Tuning (v4)
**Objective:** Benchmarking the `arb_assessment_v1` template for USPS ARB (Architecture Review Board) compliance.
**Target Model:** Vertex AI (Gemini 1.5 Pro)


---
# Cell 2: Code - Environment Setup
---

```bash
import os
from google.cloud import aiplatform
import vertexai
from vertexai.generative_models import GenerativeModel, Part

# Initialize Vertex AI
PROJECT_ID = "usps-modernization-poc"
vertexai.init(project=PROJECT_ID, location="us-east1")
model = GenerativeModel("gemini-1.5-pro")

print("Vertex AI Client Initialized.")
```
----
# Cell 3: Markdown - Test Data (Stakeholder Engagement Notes)
---
### Scenario: Legacy Parcel Tracking Modernization
*Stakeholder Notes:* "We need to move the tracking DB from on-prem Oracle to the cloud. Must handle 10k hits/sec. Security is worried about data in transit. Budget is tight—we need to show ROI in 24 months."

---
# Cell 4: Code - Prompt Execution Logic
---
```python
# Load the template (Simulating the Go engine logic)
prompt_template = """
### ROLE
You are the Senior Solutions Architect for the USPS ARB. 
Evaluate: {{.StakeholderNotes}}
Constraints: NIST 800-53, Hybrid Cloud, Cost Effectiveness.
"""

def test_prompt(notes):
    final_prompt = prompt_template.replace("{{.StakeholderNotes}}", notes)
    response = model.generate_content(final_prompt)
    return response.text

# Run Evaluation
output = test_prompt("10k hits/sec, Oracle to Cloud, tight budget.")
print(output)

```
---
# Cell 5: Markdown - Evaluation Metrics (The "Architect" Flex)
---

### Benchmark Results:
| Metric | Score (1-5) | Notes |
| :--- | :--- | :--- |
| **ARB Template Alignment** | 5 | Correctly identifies Future-State Journey Map steps. |
| **NIST 800-53 Adherence** | 4 | Mentioned encryption but needs more focus on IAM controls. |
| **Cost Analysis Accuracy** | 5 | Correctly identifies OpEx shift for GKE Autopilot. |
| **Hallucination Rate** | 0% | No invented CSP services detected. |
---

