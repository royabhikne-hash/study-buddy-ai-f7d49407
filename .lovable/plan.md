

# UI Polish Plan - Complete App Overhaul

## Overview
A comprehensive UI refinement across all major pages to achieve a more polished, premium feel consistent with the "Billion-Dollar Liquid Aesthetic" identity. Focus on micro-interactions, spacing consistency, typography hierarchy (Space Grotesk headings, Inter body), and visual depth.

## Changes by Area

### 1. Global CSS Enhancements (`src/index.css`)
- Add Space Grotesk font import for headings
- Add subtle gradient mesh background patterns
- Improve `glass-card` with stronger blur and subtle inner glow
- Add new utility classes: `.text-gradient-shimmer` (animated gradient text), `.card-hover-lift` (smooth lift on hover with glow)
- Refine scrollbar styling for dark mode
- Add smooth page transition keyframes

### 2. Landing Page (`src/pages/Landing.tsx`)
- Add liquid orb backgrounds (currently missing, unlike Login/Dashboard)
- Hero section: Add animated gradient mesh behind heading, make CTA buttons larger with glow effect
- Feature cards: Add hover lift animation with colored border glow matching icon color
- Stats bar: Add subtle gradient background with glassmorphism
- "How It Works" steps: Add connecting gradient line instead of plain border line
- CTA section: Add floating orbs and stronger gradient card background
- Footer: Minor spacing/typography refinements

### 3. Login Page (`src/pages/Login.tsx`)
- Add subtle animated gradient behind the form card
- Logo: Add soft glow/shadow effect
- Form inputs: Add focus state with colored glow matching primary
- Login button: Add gradient shimmer animation on hover
- Add subtle particle/dot pattern in background

### 4. Signup Page (`src/pages/Signup.tsx`)
- Switch from `hero-gradient` to `liquid-bg` with orbs for consistency
- Student type selector: Add animated border glow on selection
- Photo upload area: Add pulsing border animation
- Form sections: Add subtle section dividers with labels
- Progress feel: Add step indicator at top showing form completion

### 5. Student Dashboard (`src/pages/StudentDashboard.tsx`)
- Welcome card: Enhance gradient background with animated mesh
- Stat cards: Add colored left border accent, number counter animation
- Recent sessions list: Add alternating subtle backgrounds, hover effects with slide-right indicator
- Tab navigation: Add animated underline indicator
- Empty state: More engaging illustration/animation

### 6. Study Chat (`src/components/StudyChat.tsx`)
- Chat bubbles: Add subtle shadow depth, smoother entry animation
- User bubble: Stronger gradient with slight glow
- AI bubble: Add subtle left border accent
- Input area: Glassmorphism background, refined button styling
- Quiz options: Add numbered badges, smoother hover transitions

### 7. Exam Prep Dashboard (`src/components/exam-prep/ExamPrepDashboard.tsx`)
- Feature cards: Add icon background glow, hover scale effect
- Session cards: Better visual hierarchy with status indicators
- Upload area: Drag-and-drop visual feedback improvements

### 8. Tailwind Config (`tailwind.config.ts`)
- Add Space Grotesk to `fontFamily.display`
- Add new keyframe `gradient-shift` for animated backgrounds
- Add `counter-up` animation for stat numbers

### 9. Bottom Nav (`src/components/BottomNavBar.tsx`)
- Add glassmorphism effect matching glass-nav
- Active indicator: Gradient pill instead of plain line
- Add subtle haptic-feel scale animation on tap

## Technical Notes
- All changes are CSS/Tailwind-only or JSX class modifications - no backend changes
- Font loading via Google Fonts CDN (Space Grotesk already mentioned in memory)
- Animations use CSS transforms/opacity for GPU acceleration
- Mobile-first responsive approach maintained
- Dark mode variants included for all new styles

## Estimated Scope
~10 files modified, primarily class name changes and CSS additions. No logic changes.

