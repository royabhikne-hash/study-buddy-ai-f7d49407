

# Progress Tracking Redesign — Minimal & Data-Focused

## Current Problems
- Too many charts crammed together (6 charts + stat cards + lists)
- Visual noise — gradients, highlights, rings everywhere
- "AI Feedback" section has a branding bug ("AI Gyanam AI")
- Mobile experience is cluttered with 6-column stat grids
- No clear visual hierarchy — everything competes for attention

## Design Approach
Clean, Google Analytics-inspired layout. White/neutral cards, clear typography, sparse use of color only for key indicators. Remove decorative gradients, reduce chart count, prioritize scannable data.

## Plan

### 1. Simplify Header
- Remove gradient icon box and grade badge from header
- Clean single-line header: back arrow + "Progress" title + PDF download button
- Student name and class as subtitle text only

### 2. Redesign Hero Section — Key Metrics Row
Replace the WPS hero circle + 6 stat cards with a single clean row of 4 key metrics:
- **WPS Score** (big number with small trend arrow)
- **Avg Accuracy** (percentage)
- **Study Time** (total hours)
- **Streak** (days)

Each metric: large number, small label below, minimal card with thin border. No gradients, no colored icon backgrounds.

### 3. Reduce Charts to 3 Essential Views
Remove radar chart, pie chart, and composed chart. Keep only:
- **WPS + Accuracy Trend** (area chart, spanning full width) — clean single chart with two lines
- **Subject Performance** (horizontal bar chart) — half width
- **Weekly Study Pattern** (bar chart by day) — half width

All charts: remove grid lines, use subtle axis labels, monochrome primary color with one accent.

### 4. Simplify Strong/Weak Subjects
Replace the two separate colored cards with a single "Subject Health" section:
- Simple list with green/red dot indicators and subject name
- No numbered circles, no background colors on rows

### 5. Clean Test History
- Keep the test history list but simplify each row
- Remove WPS per-test display (keep only accuracy + correct/total)
- Cleaner date formatting

### 6. Fix & Simplify AI Feedback
- Fix "AI Gyanam AI" → "Gyanam AI"
- Reduce to max 3 feedback items
- Simple text list with bullet points instead of numbered circles

### 7. Mobile Optimization
- 2-column metric grid on mobile (instead of 6)
- Charts stack vertically and fill width
- Generous spacing between sections

## Files to Edit
- `src/pages/StudentProgress.tsx` — full UI rewrite of the render section + StatCard component

## No Backend Changes
All data fetching and calculations remain the same. This is a pure UI redesign.

