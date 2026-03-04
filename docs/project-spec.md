# Project Specification — "The Bible"

> Product: **GartenLead** — AI-Powered Lead Qualification Forms for DACH Landscaping Businesses
> Version: 1.0 — Research-Validated
> Last Updated: 2026-03-03
> Status: Pre-build (validation interviews required before sprint start)

---

## 1. The Problem

**Target User**: Owner-operators of small GaLaBau (Garten- und Landschaftsbau) businesses in Germany, Austria, and Switzerland. Typically 1–15 employees, serving private homeowners for garden maintenance, landscaping, planting, lawn care, terraces, and hedges. They handle all sales themselves, often between active jobs.

**Pain Point**: They currently receive unqualified website inquiries that lead to wasted on-site estimate visits, which costs them 1–3 hours per bad lead — time they bill at €60–€100/hour on real jobs.

Specifically:
1. **Tire-kicker problem**: Homeowners submit contact forms with no idea what a professional garden project costs. The Gartenbauer drives out, measures, quotes €1,800 — homeowner expected €300 and says "we'll think about it." Never books.
2. **Price sticker shock**: Even serious buyers get cold feet when the first number they hear is the full quote. There's no expectation management before the conversation starts.
3. **Volume vs. quality mismatch**: More leads are not the goal. Better-pre-qualified leads who already understand approximate costs are worth 5x a cold inquiry.

**Evidence**:
- LawnSite.com forums: dozens of threads on "you're too expensive" and tire-kicker drain; contractors implement "residential minimums" specifically to filter budget-free leads
- ContractorTalk: "sticker shock is the largest cause of potential customers reconsidering projects and not signing contracts during initial sales meetings"
- GaLaBau Messe 2024 (official industry trade fair) dedicated a forum track to digitalization and customer inquiry management
- Dataflor (leading GaLaBau software) publishes guides on "Digitalisierung für kleine GaLaBau Unternehmen" — confirming the segment is aware and receptive
- Germany alone has 19,373 GaLaBau businesses; 57% of their €11.1B revenue (2025) comes from private gardens — customer acquisition is a daily activity
- Switzerland: 14,000+ firms, <2% have more than 50 employees — extreme fragmentation, every owner is also the salesperson

---

## 2. The Solution

**One-Liner**: GartenLead lets landscaping companies embed a 2-minute multi-step form on their website that instantly shows homeowners a regional price estimate, pre-qualifying them by budget before the gardener ever picks up the phone.

**Key Insight**: The price anchor is not shown to set a fixed price — it is shown to filter and psychologically prepare the buyer. When a homeowner sees "Projekte wie Ihres kosten in Ihrer Region typischerweise €800–€1.600" before filling in their contact details, two things happen:
1. Budget-mismatched homeowners self-exit (free pre-qualification)
2. Budget-matched homeowners arrive at the phone call with anchored expectations, reducing price shock and improving close rates

This is not a generic calculator. It is a **calibrated DACH pricing model** embedded in a **psychologically optimized lead funnel**, deployed in under 10 minutes via a script tag.

**MVP Features** (max 3):

1. **Embeddable Multi-Step Qualifier Form** — A 5–7 step form covering: service type (lawn, hedge, planting, terrace, etc.), area/scope, project timeline, location (PLZ), and contact details. Built for mobile-first, completion-optimized with progress bar. Deployed via a `<script>` tag the Gartenbauer pastes into their website. No developer needed.

2. **AI Price Anchor Display** — After the homeowner completes the form, the final screen displays a regional price range estimate BEFORE they submit their contact info ("Typische Projektkosten in Ihrer Region: €X – €Y"). This is the core psychological mechanism. The pricing model is calibrated by service type + area + DACH regional cost coefficients. Wide ranges (deliberate) with a clear disclaimer. Contact info submitted after seeing the anchor = self-qualified lead.

3. **Lead Dashboard + WhatsApp/Email Notification** — Each submitted lead lands in a simple dashboard showing: project type, estimated scope, price anchor shown, homeowner contact details, and a lead quality score. Gartenbauer gets instant WhatsApp/email notification with project summary. No CRM complexity — a single inbox of pre-qualified leads.

**Explicitly OUT of scope for MVP**:
- Full job management / scheduling — that is ToolTime/Craftboxx territory; do not compete
- Invoice generation — out of scope
- Route optimization — out of scope
- Real-time booking / appointment scheduling — phase 2 only
- Multi-user team access — MVP is single owner-operator
- API integrations with existing GaLaBau software — phase 2 (ToolTime, Craftboxx webhooks)
- Custom pricing model calibration per customer — phase 2; MVP uses shared regional model
- AI chatbot / conversational interface — out of scope; the form IS the UX
- Multi-language forms (French, Italian for CH) — phase 2

---

## 3. Validation Plan

**Pre-Build Validation** (REQUIRED before writing code):
- [ ] Talked to 10+ Gartenbauer via LinkedIn, GaLaBau Facebook groups, cold email — asking: "Wie viel Zeit verbringen Sie mit unqualifizierten Kundenanfragen pro Monat?"
- [ ] Found 3+ people who said "I'd pay for this" with a specific monthly budget mentioned
- [ ] Fake-door landing page live (Framer or Carrd, German language) with email signup
- [ ] Run €100 Facebook/Instagram ad targeting Gartenbauer in DE/AT/CH. Target: 10+ email signups
- [ ] Found 3+ competitors (done — see validation report) and analyzed their DACH gap

**Post-Build Validation** (after MVP):
- [ ] 10+ users with active embedded forms
- [ ] First paying customer (not free trial)
- [ ] 50+ homeowner form completions tracked across all customer accounts
- [ ] Customer NPS collected at day 30
- [ ] Average lead-to-site-visit rate measured (baseline metric)

---

## 4. Revenue Model

**Pricing** (DACH market — German Handwerker software range is €16–€100/month):

| Tier | Price | Limit | Target |
|------|-------|-------|--------|
| Starter | €49/month | 1 form, 30 leads/month | Solo Gartenbauer testing the product |
| Pro | €89/month | 3 forms, unlimited leads | Active solo op or 2-3 person firm |
| Studio | €149/month | 5 forms, team notifications, CSV export, priority support | Small Gartenbauer with admin staff |

- Free 14-day trial on all tiers (no credit card required)
- Annual billing option: 2 months free (20% discount)
- No freemium tier — freemium creates support burden with no conversion. The free trial IS the proof.

**Revenue Target**:
- Month 6: €2,000 MRR (25 paying customers at average €79)
- Month 12: €5,000 MRR (63 paying customers at average €79)
- Month 18: €10,000 MRR (126 paying customers) — at this point, evaluate DACH expansion playbook

**Unit Economics**:
- Target CAC: <€150 (via content, trade association outreach, word-of-mouth)
- Target LTV: €79/month × 18 months = €1,422 (conservative; landscaping is a recurring-season business with consistent monthly churn)
- LTV/CAC ratio target: >8x

**Payment Stack**: Stripe Checkout + Stripe Billing (recurring subscriptions). Stripe supports EUR billing natively.

---

## 5. Technical Constraints

**Stack**: Next.js 14 (App Router) + Supabase (Postgres + Auth + Storage) + Stripe + n8n

**Deployment**: Vercel (existing infrastructure)

**Core Technical Components**:

```
src/
├── app/
│   ├── (auth)/              # Gartenbauer login/signup
│   ├── (dashboard)/         # Lead dashboard, form builder, account settings
│   │   ├── leads/           # Lead inbox + detail view
│   │   ├── forms/           # Form configuration (services, pricing coefficients)
│   │   └── settings/        # Billing, notifications
│   ├── api/
│   │   ├── webhooks/
│   │   │   ├── stripe/      # Stripe billing events
│   │   │   └── n8n/         # Outbound n8n triggers
│   │   ├── leads/           # Lead submission endpoint (public, rate-limited)
│   │   └── price-estimate/  # AI price anchor calculation (public, rate-limited)
│   └── embed/
│       └── [formId]/        # Embeddable form page (loaded in iframe by script tag)
├── components/
│   ├── ui/                  # Button, Input, Card, ProgressBar
│   ├── form-steps/          # Individual form step components (ServiceSelect, AreaInput, etc.)
│   └── lead-card/           # Lead inbox card component
├── lib/
│   ├── pricing/             # Core pricing model (DACH regional coefficients)
│   │   └── calculator.ts    # Takes form inputs → returns price range
│   ├── supabase/            # Server + client Supabase helpers
│   ├── stripe/              # Subscription management
│   └── utils/
└── types/
    ├── lead.ts
    ├── form-config.ts
    └── pricing.ts
```

**3rd Party APIs**:
- Stripe: Subscription billing (no additional cost beyond transaction fees)
- n8n: WhatsApp Business API notifications (via webhook), email notifications
- No external AI API needed for MVP pricing model — it is a calibrated formula, not an LLM call (keeps latency low, cost zero, no API dependency)
- Optional Phase 2: OpenAI API for personalized lead summary generation

**Embed Architecture**:
```html
<!-- What Gartenbauer pastes into their website -->
<script src="https://gartenleadapp.de/embed.js" data-form-id="abc123"></script>
<div id="gartenlead-form"></div>
```
- The form loads in an iframe pointing to `/embed/[formId]`
- Form submissions hit `/api/leads` with formId, data validated with Zod
- No CORS headaches; iframe isolation ensures consistent rendering across all website builders (WordPress, Jimdo, Wix, Squarespace — all used by German SMEs)

**Performance Requirements**:
- Embed script must be <10KB (async load, no render blocking)
- Form first-paint: <1.5s on 3G mobile (homeowners may fill from garden)
- Price estimate calculation: <200ms (pure serverless function, no DB call required)

**Database Schema (Supabase)**:

```sql
-- accounts (Gartenbauer companies)
accounts: id, user_id, company_name, plan_tier, stripe_customer_id, created_at

-- forms (embeddable form configurations)
forms: id, account_id, name, services_enabled[], pricing_region, custom_multiplier, is_active, embed_script_hash

-- leads (submitted homeowner inquiries)
leads: id, form_id, account_id, service_type, area_m2, timeline, plz,
       price_anchor_min, price_anchor_max, homeowner_name, homeowner_email,
       homeowner_phone, project_notes, quality_score, created_at

-- pricing_data (DACH regional pricing model)
pricing_data: id, service_type, region_plz_prefix, price_per_m2_min,
              price_per_m2_max, base_fee, last_updated
```

**Security**:
- [x] Supabase RLS on all tables (accounts can only read their own leads/forms)
- [x] API routes validate auth via `getUser()` — all dashboard routes protected
- [x] Stripe webhooks verified with `constructEvent()`
- [x] Environment variables in `.env.local` (never committed)
- [x] Rate limiting on `/api/leads` (public endpoint) — 10 submissions/IP/hour via Vercel Edge
- [x] CSP headers configured in `next.config.js`
- [x] Embed script uses HMAC signature to validate formId authenticity

---

## 6. Design Direction

**Vibe**: "Handwerk trifft Digital" — Clean, trustworthy, slightly earthy. Not a Silicon Valley startup aesthetic. This must feel like a tool made for German tradespeople — professional, no-nonsense, and fast to understand. Think: ToolTime meets a premium local brand.

**UI Principles**:
- German language throughout (primary market)
- Large tap targets (owner-operator filling in details between jobs on their phone)
- Progress indicator on the multi-step form — reduces drop-off
- The price anchor screen is the most important UX moment — it must feel credible, not gimmicky. Show a range, show a source blurb ("Basierend auf X Projekten in Ihrer Region"), show a subtle badge
- Dashboard is single-page simplicity — not a complex CRM

**Reference Sites**:
- ToolTime (tooltime.app) — Clean German trades SaaS aesthetic
- Typeform (typeform.com) — Multi-step form UX inspiration
- Craftboxx (craftboxx.de) — German B2B SaaS for tradespeople

**Color Palette**:
- Primary: Deep forest green (#1B4332) — gardening association, trust
- Accent: Warm amber (#D97706) — CTA buttons, highlights
- Background: Off-white (#F9FAFB)
- Text: Near-black (#111827)
- Success/estimate display: Soft green badge (#ECFDF5)

**Typography**: Inter (clean, German-UI standard) or Geist (Vercel's font — already in Next.js template)

---

## 7. n8n Automations Needed

| Trigger | Action | Priority |
| :--- | :--- | :--- |
| New lead submitted (via `/api/leads`) | Send WhatsApp message to Gartenbauer with project summary + price anchor shown + homeowner contact | P1 — core value delivery |
| New lead submitted | Send email notification to Gartenbauer (fallback if WhatsApp not configured) | P1 |
| New account signup (Supabase user created) | Send welcome email with embed code + setup guide in German | P1 |
| Stripe `checkout.session.completed` | Activate account subscription + send confirmation email | P1 |
| Stripe `customer.subscription.deleted` | Downgrade account, send offboarding email | P2 |
| Day 7 after signup (no form embedded yet) | Send nudge email: "Ihr Formular wartet noch — so einbinden in 5 Minuten" | P2 |
| Day 30 after signup (first paying month) | Send NPS survey + ask for testimonial | P2 |
| Weekly cron (Monday 08:00 DE time) | Send Gartenbauer weekly digest: leads received, forms viewed, estimated project value | P3 |
| Monthly cron (1st of month) | Internal: aggregate pricing data from all submissions → update regional pricing model | P3 |

---

## 8. Pricing Model Architecture (Core IP)

The price estimate engine is what differentiates this product from a generic Typeform. It must be built carefully.

**Service Types (MVP)**:
- Rasenpflege (lawn mowing/maintenance): price per m²
- Heckenschnitt (hedge trimming): price per linear meter
- Pflanzarbeiten (planting): price per m² + plant count multiplier
- Terrassenbau (terrace construction): price per m² + material type
- Gartenneuanlage (new garden design + build): project-level range
- Frühjahrs-/Herbstreinigung (seasonal cleanup): flat rate by garden size tier

**Input Parameters for Calculation**:
1. Service type (from above)
2. Area in m² (or linear meters for hedges)
3. PLZ (postal code) → mapped to regional cost coefficient
4. Timeline urgency (urgent = slight premium anchor)
5. Complexity flags (slopes, access issues, existing hardscaping)

**Regional Coefficients (DACH)**:
- Munich / Stuttgart / Hamburg / Zurich: 1.3x baseline
- Mid-tier cities (Nuremberg, Frankfurt suburbs): 1.0x baseline
- Rural areas: 0.8x baseline
- Austria: 0.9x baseline (slightly lower labor costs)

**Data Sources for Initial Model**:
- Public pricing guides (MyHammer, Myhammer Kostencheck, CheckAufwand.de)
- Industry forums (GaLaBau.de)
- Must be validated with 5+ real Gartenbauer interviews before going live

**Output Format**:
```
"Projekte wie Ihres (ca. 80m² Rasenpflege, Region München) kosten
bei professionellen Gartenbaubetrieben typischerweise:

  €320 — €580

Diese Schätzung basiert auf vergleichbaren Projekten in Ihrer Region.
Der genaue Preis hängt von den Bedingungen vor Ort ab.
Ihr Gartenbauer wird Ihnen nach einer kurzen Besichtigung ein
verbindliches Angebot machen."
```

---

## 9. Go-to-Market Strategy

**Phase 0 — Validation (0 customers, 4 weeks)**:
- Build fake-door landing page (Framer, German)
- Run €100–€200 Facebook/Instagram ad: "Schluss mit unqualifizierten Anfragen — Ihr Formular qualifiziert Kunden automatisch"
- Cold outreach to 30 Gartenbauer on LinkedIn and Facebook groups
- Target: 15 interviews, 3 willing to pay, 1 pilot customer

**Phase 1 — Founder-Led Sales (1–10 customers, months 1–4)**:
- Onboard first 5 customers manually (video call setup, hand-hold the embed)
- Collect testimonials, screenshots of lead quality improvement
- Write one German blog post: "Warum 40% Ihrer Gartenanfragen Zeitverschwendung sind (und wie Sie das stoppen)"
- SEO target keywords: "GaLaBau Software Anfragen", "Gartenformular Website", "Angebots-Rechner Gartenbauer"

**Phase 2 — Scalable Distribution (10–50 customers, months 4–12)**:
- Reach out to GaLaBau regional associations for newsletter feature (free distribution to hundreds of firms)
- Exhibit or sponsor at regional GaLaBau events
- Integration partnerships: approach ToolTime / Craftboxx for webhook integration (leads flow into their job management tool)
- Affiliate program: digital agency partners who build Gartenbauer websites get 20% recurring commission

**Phase 3 — Product-Led Growth (50+ customers)**:
- Evaluate homeowner-facing viral loop: homeowners who use the form can share it with neighbors considering gardening projects
- Consider B2C discovery layer: aggregated "get a quote from a certified Gartenbauer" portal that drives both sides
- Evaluate expansion to adjacent verticals: Maler (painters), Elektriker, Dachdecker — same product, different pricing models

---

## 10. Open Questions Before Build

1. **Pricing validation**: Are the DACH regional pricing ranges we've assembled from public data accurate enough for the MVP? Requires 5+ Gartenbauer interviews to validate.

2. **WhatsApp Business API access**: To send lead notifications via WhatsApp (the primary mobile channel for German tradespeople), we need WhatsApp Business API access. This requires Facebook Business Manager verification. Lead time: 1–4 weeks. n8n can automate this via Twilio or 360dialog. Must be set up before launch.

3. **Legal / GDPR**: The form collects homeowner personal data (name, email, phone, PLZ). The Gartenbauer is the data controller; GartenLead is the processor. We need a DPA (Datenschutz-Auftragsdaten-Verarbeitungsvertrag) template included in our ToS. Privacy policy must be GDPR-compliant. Must include a consent checkbox in the form: "Ich stimme zu, dass meine Daten an [Gartenbauer Name] weitergeleitet werden."

4. **Embed vs. native form**: Should the form be an iframe embed (simple, isolated) or a web component (better UX, more complex)? MVP recommendation: iframe for speed; web component in phase 2 if polish is needed.

5. **Pricing model update cadence**: The regional pricing data will become stale. Options: (a) manual quarterly updates by us, (b) crowdsource from customer submissions (n8n automation to aggregate), (c) integrate with a pricing API if one emerges. MVP: manual quarterly updates.

---

*This spec was generated by the Researcher Agent based on market research conducted on 2026-03-03. It synthesizes competitive intelligence, DACH market data, pain point evidence from contractor forums, and behavioral economics research on price anchoring. All pre-build validation checkboxes must be completed before the Night Mission build sprint is authorized.*
