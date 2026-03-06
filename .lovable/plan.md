

## All Edge Functions in Your Project

Here is the complete list of all **17 edge functions** with what each one does:

| # | Function Name | Purpose | How to Test |
|---|---|---|---|
| 1 | **study-chat** | AI study assistant chat | Open Study Page → select topic → send a message |
| 2 | **generate-quiz** | Generates quiz after study session | Study a topic → click "Take Quiz" at end |
| 3 | **generate-mcq** | Generates MCQ practice questions | Go to MCQ Practice → select subject/chapter → start |
| 4 | **analyze-answer** | Checks student's answer & gives feedback | Answer a question in study chat or MCQ |
| 5 | **text-to-speech** | Converts text to audio (Speechify) | Click the speaker/voice icon on any AI response |
| 6 | **get-schools-public** | Lists schools & coaching centers | Visit Schools Directory page |
| 7 | **get-students** | Gets student rankings/list | View Student Rankings on dashboard |
| 8 | **manage-subscription** | Handles subscription plans | Check subscription status on dashboard |
| 9 | **secure-auth** | Token validation & auth | Used automatically during login/session |
| 10 | **parent-chat** | Parent chatbot for queries | Login as parent → use chat |
| 11 | **parent-dashboard** | Parent dashboard data | Login as parent → view dashboard |
| 12 | **school-student-approval** | School approves/rejects students | Login as school → manage students |
| 13 | **manage-coaching** | Coaching center management | Login as coaching → manage students |
| 14 | **notify-school-registration** | WhatsApp notification to school | Triggered when student registers under a school |
| 15 | **save-weekly-rankings** | Saves weekly ranking data | Background/scheduled task |
| 16 | **send-weekly-report** | Sends weekly reports to parents | Background/scheduled task |
| 17 | **seed-schools** | Seeds school data into database | Admin utility function |

### Testing Guide

**As Student (your current login):**
- Test #1, #2, #3, #4, #5, #6, #7, #8

**As Parent:**
- Test #10, #11

**As School:**
- Test #12

**As Coaching Center:**
- Test #13

**Background/Admin (can't test from UI):**
- #14, #15, #16, #17 — these run automatically or via admin triggers

Tell me which function has an issue and I'll fix it immediately.

