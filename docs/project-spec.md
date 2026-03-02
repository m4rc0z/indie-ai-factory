# Project Specification — "The Bible"

> Fill this document before running the Night Mission. This is the Single Source of Truth for your project.
> You can fill it manually or use NotebookLM to synthesize research data.

---

## 1. The Problem

**Target User**: [Who has this problem? Be specific: "Solo founders with <$1k MRR" not "entrepreneurs"]

**Pain Point**: [What's the #1 pain? Use this format: "They currently [bad solution] which causes [frustration]"]

**Evidence**: [How do you know? Link to Reddit threads, Trustpilot reviews, survey data, or NotebookLM analysis]

---

## 2. The Solution

**One-Liner**: [Describe in one sentence what you're building]

**Key Insight**: [What's your unique angle? Why hasn't this been built before?]

**MVP Features** (max 3):
1. [Feature 1] — [Why it's essential]
2. [Feature 2] — [Why it's essential]
3. [Feature 3] — [Why it's essential]

**Explicitly OUT of scope for MVP**:
- [Feature X — why it's deferred]
- [Feature Y — why it's deferred]

---

## 3. Validation Plan

**Pre-Build Validation** (before writing code):
- [ ] Talked to 5+ potential users
- [ ] Found 3+ competitors (and analyzed their weaknesses)
- [ ] Have a waitlist/landing page live
- [ ] At least 1 person said "I'd pay for this"

**Post-Build Validation** (after MVP):
- [ ] 10+ users signed up
- [ ] First paying customer
- [ ] NPS score collected

---

## 4. Revenue Model

**Pricing**:
- Free tier: [What's included?]
- Paid tier: $[X]/month — [What's unlocked?]

**Revenue Target**: $[X] MRR in [Y] months

**Payment Stack**: Stripe Checkout + Stripe Billing

---

## 5. Technical Constraints

**Stack**: [Default: Next.js 14 + Supabase + Stripe — modify if needed]

**Deployment**: [Default: Vercel — modify if needed]

**3rd Party APIs**: [List any external APIs needed]

**Performance**: [Any specific requirements? e.g., "Page load < 2s"]

---

## 6. Design Direction

**Vibe**: [e.g., "Minimal + Premium", "Playful + Colorful", "Dark + Technical"]

**Reference Sites**: [Link 2-3 sites that inspire you]

**Color Palette**: [If you have preferences, otherwise leave for the agent]

---

## 7. n8n Automations Needed

| Trigger | Action | Priority |
| :--- | :--- | :--- |
| [e.g. New signup] | [e.g. Welcome email + Slack notification] | [P1/P2/P3] |
| [e.g. Stripe payment] | [e.g. Fulfilment + Thank-you email] | [P1/P2/P3] |
| [e.g. Weekly cron] | [e.g. Analytics report to Telegram] | [P1/P2/P3] |
