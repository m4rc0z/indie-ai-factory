# Frontend Design Skill

> A community skill for generating premium, production-ready frontend UIs.
> Load this skill when working on any frontend: landing pages, dashboards, components, settings panels.

## Design Philosophy

Bold typography, distinctive color palettes, high-impact animations, responsive layouts.
Claude picks an aesthetic direction automatically based on your description.

## Usage

Just describe what you need:
```
Create a dashboard for a music streaming app
Build a landing page for an AI security startup
Design a settings panel with dark mode
```

## Design Principles

### Typography
- Use modern type scales: `text-4xl` / `text-5xl` for headlines, `text-base`/`text-lg` for body
- Prefer Google Fonts (Inter, Outfit, Geist) over browser defaults
- Letter-spacing and line-height matter — use `tracking-tight` for headlines

### Color Palettes
- Avoid generic colors (plain red, blue, green)
- Use curated HSL palettes: e.g., `hsl(260, 84%, 60%)` for vibrant purple
- Dark mode: not just `bg-black` — use `bg-slate-950` or custom CSS variables
- Ensure WCAG 4.5:1 contrast for text on all backgrounds

### Motion & Micro-Animations
- Entrance animations: fade-in + slide-up on load (`@keyframes` or Framer Motion)
- Hover effects: scale, shadow lift, color shift — all transitions at `200–300ms ease`
- Avoid animation on critical interactive paths (forms, buttons mid-action)

### Layout Patterns
- Use CSS Grid for page layouts, Flexbox for component internals
- Responsive: mobile-first, breakpoints at `sm:640px`, `md:768px`, `lg:1024px`
- Generous whitespace: `py-16 md:py-24` for sections, not tight padding

### Component Patterns
- Cards: rounded-xl, subtle border or shadow, hover lift effect
- Buttons: filled primary + outline secondary, consistent border-radius
- Inputs: floating labels or clear placeholder text, focus ring visible
- Loading states: skeleton screens, not spinners for content areas

## Premium UI Checklist

Before finishing any UI work:
- [ ] Contrast ratio ≥ 4.5:1 for all text
- [ ] Hover/focus states on all interactive elements
- [ ] Loading and empty states defined
- [ ] Mobile layout tested (320px–768px)
- [ ] Dark mode doesn't invert unexpectedly
- [ ] Animations respect `prefers-reduced-motion`

## ⚠️ Reliability Warning

Skills are not always loaded reliably by Claude Code. Critical design rules (like the color system or button patterns for this specific project) should be documented in `CLAUDE.md` or the relevant folder-level `CLAUDE.md`, not only here.
