# The Indie AI Factory Workflow 🏭

This document outlines the exact end-to-end process of taking an idea and turning it into a revenue-generating product using the Indie AI Factory stack (NotebookLM, Claude Code, and Antigravity).

---

## Phase 1: Research & "The Bible" (Idea to Spec)

Before writing any code, the idea must be validated and structured into our strictly formatted `docs/project-spec.md`. You have two powerful ways to do this:

### Option A: The Deep Dive Approach (NotebookLM)
NotebookLM acts as your strategic co-founder. Because it grounds its answers strictly in the documents you provide, it is perfect for synthesizing chaotic market data into a clean spec.

1. **Source Gathering:** 
   - Speichere als PDF ab: Websites von 3-5 Konkurrenten, Pricing Pages, Feature-Listen.
   - Kopiere Top-Reddit-Threads oder Hacker News Diskussionen über das konkrete Problem.
   - Lade alles in ein neues [NotebookLM](https://notebooklm.google.com/) Projekt.
2. **Initialer Prompt:**
   - Lade das leere `docs/project-spec.md` Template in NotebookLM hoch oder füge die Struktur in den Chat ein.
   - *Prompt:* `"Basierend auf unseren Quellen, fülle dieses Project Spec Template komplett aus. Analysiere unsere Konkurrenten und finde unseren 'Unfair Advantage'. Sei sehr spezifisch beim Revenue Model und der Go-to-Market Strategie."*
3. **Das "Grill-Gespräch" (Refinement):**
   - Akzeptiere den ersten Entwurf nicht sofort. "Grille" das Notebook:
   - *Prompt 1:* `"Ist das Pricing Modell im Vergleich zur Konkurrenz im Dokument realistisch? Was ist die Zahlungsbereitschaft der zitierten Reddit-User?"*
   - *Prompt 2:* `"Die Go-to-Market Strategie ist zu generisch. Wie bekommen wir basierend auf den Quellen unsere ersten 10 Kunden in Woche 1 mit 0€ Budget?"*
   - *Prompt 3:* `"Erstelle mir einen detaillierten Feature-Gegenentwurf zu [Konkurrent X]. Was können wir in V1 weglassen, um schneller zu launchen?"*

### Option B: The Autonomous Approach (Claude Desktop/Code + MCP)
Wenn du nicht manuell Quellen sammeln willst, lass eine KI mit **MCP (Model Context Protocol)** das Web für dich durchsuchen und die Spec autonom schreiben.

1. **Setup:** Nutze Claude Desktop oder Claude Code mit installierten MCP-Servern (z.B. `Brave Search MCP` oder `Puppeteer MCP`).
2. **Der Mega-Prompt:** 
   ```text
   Nutze das Brave Search MCP, um den Markt für [DEINE IDEE] zu analysieren.
   1. Finde die Top 3 Konkurrenten und ihre Pricing-Modelle.
   2. Finde heraus, was User an diesen Produkten hassen (Suche nach "site:reddit.com alternative zu [Konkurrent]").
   3. Sobald du genug Daten hast, schreibe die Erkenntnisse streng nach dem Format der Datei `docs/project-spec.md` auf.
   ```
3. **Iterative Verfeinerung:** Die KI kann direkt Folgeaufträge via MCP ausführen (*"Lies dir mal gezielt das Changelog von Konkurrent X durch und schau, was die zuletzt gebaut haben."*).

*Ergebnis von Phase 1:* Eine zu 100% ausgefüllte `docs/project-spec.md`.

---

## Phase 2: Factory Setup (Initialize)

Sobald die Spec ("The Bible") steht, startest du die Maschine.

1. Gehe auf das GitHub Template: `https://github.com/m4rc0z/indie-ai-factory`
2. Klicke auf **"Use this template"** → Erstelle ein eigenes Repo (z.B. `mein-neues-saas`).
3. Clone dein neues Repo lokal auf deinen Mac:
   ```bash
   git clone git@github.com:DEIN_USER/dein-neues-saas.git
   cd dein-neues-saas
   ```
4. Führe das Setup-Script aus:
   ```bash
   ./setup.sh
   ```
   *(Zieht die Skills, installiert Dependencies, baut die `.env.local` Vorlage).*
5. **Kopiere deine fertige `project-spec.md` in den Ordner `docs/`.**

---

## Phase 3: Architektur & Foundation (Claude Code)

Nutze *Claude Code* (`claude` im Terminal) für das extrem schnelle, token-effiziente Setup des Datenmodells und der Architektur.

1. **Starte Claude Code:**
   ```bash
   claude
   ```
2. **Architektur planen:**
   `"Lies die docs/project-spec.md. Schreibe mir einen technischen Architektur-Plan (Route-Struktur, Supabase Tabellen, n8n Webhooks) in eine neue Datei .antigravity/artifacts/architecture.md. Beachte unser in CLAUDE.md definiertes Stack."`
3. **Datenbank-Schema generieren:**
   `"Erstelle basierend auf der architecture.md das SQL-Schema für Supabase unter supabase/schema.sql inkl. RLS Policies."`

---

## Phase 4: The Heavy Build Run (Antigravity Night Mission)

Wenn die Architektur und das Spec stehen, übernimmt **Antigravity** den Heavy Lift (den Erstaufbau des UI/UX, Pages und logischen Komponenten).

1. Öffne Cursor oder VS Code, triggere Antigravity:
   ```text
   Lade die project-spec.md und die architecture.md in dein Context-Window. 
   Führe den Workflow /night-mission aus, um basierend auf diesen Dokumenten unser MVP zu bauen.
   ```
2. **Was passiert nun?**
   - Antigravity schreibt sich selbst einen `task_plan.md`.
   - Baut das Design System (Farben, Tailwind).
   - Generiert iterativ alle Komponenten und Seiten.
   - Führt Auto-Commits aus und validiert das UX visuell.
   - Du gehst ins Bett oder holst dir einen Kaffee. ☕

---

## Phase 5: The Daily Loop (Iterate & Ship)

Wenn das MVP zu 80% steht, wechselst du in den schnellen Daily Workflow, optimiert durch unsere *Claude Code Best Practices*:

- **Morgens (Status Check):**
  Nutze den neuen Slash-Command über Claude Code:
  ```bash
  /health
  ```
- **Tagsüber (Bauen):**
  Nutze Claude Code für Feature-Implementierungen mit der WHAT/WHERE/HOW/VERIFY Formel.
  WICHTIG: Begrenze Tasks. Ein Feature = Ein Kontext. Sobald fertig:
  ```bash
  /compact
  ```
- **Code Reviews einholen:**
  Bevor du pushst, lass den Security Agent drüberschauen:
  ```bash
  /agent reviewer "Check ob die neue Stripe-Webhook Route sicher ist."
  ```
- **Abends (Handoff):**
  Mache reinen Tisch für den nächsten Tag oder für eine weitere Night Mission:
  ```bash
  /handoff
  ```

---
*Die Indie AI Factory stellt sicher, dass du nie am leeren Blatt startest, architektonische Best-Practices erzwingst und KI-Ressourcen (Tokens, Context Window) maximal effizient nutzt.*
