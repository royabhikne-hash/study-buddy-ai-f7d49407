

# Study Buddy AI - Complete App Overview

## What is Study Buddy AI?

Study Buddy AI is a **full-stack AI-powered education platform** built for Indian students (CBSE, ICSE, Bihar Board). It connects students, schools, coaching centers, parents, and admins in one ecosystem.

**Live URL**: https://studybuddyaiapp.lovable.app

---

## User Roles & Portals

### 1. Students (`/dashboard`, `/study`, `/mcq-practice`, `/weekly-test`, `/exam-prep`, `/profile`, `/progress`)
- **AI Study Chat** — Conversational AI tutor (Gemini 3 Flash) that teaches topic-by-topic based on board/class/subject syllabus
- **MCQ Practice** — AI-generated multiple choice questions with instant evaluation
- **Weekly Test** — Automated weekly assessments covering studied subjects
- **AI Exam Prep** — Upload study materials (PDF), AI extracts content, creates personalized study plans, and generates virtual exams (MCQ + short + long answers) with predicted board percentage
- **Progress Tracking** — Session history, understanding levels, weak/strong areas
- **Rankings** — School-level, district-level, and global leaderboards updated weekly
- **Achievements & Badges** — Gamification system with trophies and rank notifications
- **Subscription Plans** — Starter (₹50), Basic (₹99), Pro (₹199) per month
- **Voice Features** — Text-to-Speech (auto-speak AI responses) + Voice-to-Text input
- **Bottom Navigation** — Mobile-first with Home, Study, MCQ, Progress, Profile tabs

### 2. Schools (`/school-login`, `/school-dashboard`)
- Approve/reject student registrations
- View all enrolled students with search/filter
- Monitor student study analytics and progress
- Manage student subscriptions and bans
- School-specific ranking leaderboards

### 3. Coaching Centers (`/coaching-login`)
- Similar to school portal for coaching institute students
- Manage coaching students separately from school students

### 4. Parents (`/parent-view`)
- View child's study progress via secure access token
- AI-powered Parent Chatbot for asking about child's performance
- Weekly PDF reports sent via WhatsApp (Twilio integration)

### 5. Admin (`/admin-login`, `/admin-dashboard`)
- **Students Tab** — Full CRUD, approve/ban students, view reports
- **Schools Tab** — Manage schools, ban/unban, reset passwords
- **Rankings Tab** — View and manage weekly rankings
- **Subscriptions Tab** — Analytics on plan distribution, expiring subs
- **AI Costs Tab** — Per-student AI usage tracking, daily cost trends, DB/infrastructure cost monitoring with projected monthly expenses in INR

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18 + TypeScript + Vite |
| UI | Tailwind CSS + shadcn/ui + Radix UI |
| Backend | Lovable Cloud (Supabase) |
| AI Model | Google Gemini 3 Flash Preview |
| TTS | Web Speech API + Speechify (Pro) |
| Notifications | Twilio (WhatsApp) |
| Mobile | Capacitor (Android/iOS wrapper) |
| Language | English + Hindi (bilingual) |

---

## Database (25+ tables)

**Core**: `students`, `schools`, `coaching_centers`, `admins`, `subscriptions`
**Study**: `study_sessions`, `chat_messages`, `quiz_attempts`, `mcq_attempts`, `weekly_tests`, `chapter_progress`
**Exam Prep**: `exam_prep_sessions`, `exam_prep_messages`, `exam_prep_materials`, `exam_prep_invites`, `exam_prep_usage`
**Rankings**: `ranking_history`, `achievements`, `rank_notifications`
**System**: `session_tokens`, `login_attempts`, `ai_rate_limits`, `daily_usage`, `parent_access_tokens`, `parent_reports`, `upgrade_requests`, `ai_usage_log`

All tables have strict **Row-Level Security (RLS)** policies.

---

## 19 Edge Functions

**Student Core**: `study-chat`, `generate-quiz`, `generate-mcq`, `analyze-answer`, `text-to-speech`, `exam-prep`
**Data**: `get-schools-public`, `get-students`, `manage-subscription`
**Parent/Admin**: `parent-chat`, `parent-dashboard`, `school-student-approval`, `manage-coaching`, `secure-auth`, `admin-ai-usage`
**System**: `notify-school-registration`, `save-weekly-rankings`, `send-weekly-report`, `seed-schools`

---

## Subscription & Pricing Model

| Plan | Price | For | Features |
|------|-------|-----|----------|
| Starter | ₹50/mo | Coaching students | Basic chat, limited MCQ |
| Basic | ₹99/mo | School students | Full chat, MCQ, weekly test |
| Pro | ₹199/mo | All | Everything + Exam Prep, TTS, priority AI |

Auto-assigned on signup. 30-day cycles with auto-downgrade on expiry.

---

## Cost Per User (Estimated)

| Component | Cost/User/Day |
|-----------|--------------|
| AI (Gemini) | ~₹0.5–1.5 |
| Database | ~₹0.10 |
| Storage | ~₹0.10 |
| TTS (Web) | ₹0 |
| **Total** | **~₹0.7–1.7/day** |

At 500 Pro users: ~₹17,000/month cost vs ₹99,500 revenue = **~83% margin**

---

## Security Features
- Bcrypt password hashing for school/admin/coaching logins
- Session tokens with expiry and revocation
- AI rate limiting (30 requests per 5 minutes)
- RLS on every table
- Login attempt tracking
- Input validation and sanitization

---

## Key Highlights
- **Bilingual** (English/Hindi toggle)
- **Dark/Light theme** support
- **Mobile-first** design with Capacitor for native Android/iOS
- **Gamification** with rankings, achievements, badges
- **Real-time AI cost monitoring** for admins
- **Parent WhatsApp reports** via Twilio

