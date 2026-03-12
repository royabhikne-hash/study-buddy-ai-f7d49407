
-- Study Blaster: study_projects table
CREATE TABLE public.study_projects (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  student_id UUID NOT NULL REFERENCES public.students(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT,
  target_date DATE,
  ai_summary TEXT,
  ai_key_concepts JSONB DEFAULT '[]'::jsonb,
  ai_study_guide JSONB DEFAULT '[]'::jsonb,
  ai_faqs JSONB DEFAULT '[]'::jsonb,
  processing_status TEXT NOT NULL DEFAULT 'idle',
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Study Blaster: study_sources table
CREATE TABLE public.study_sources (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id UUID NOT NULL REFERENCES public.study_projects(id) ON DELETE CASCADE,
  student_id UUID NOT NULL REFERENCES public.students(id) ON DELETE CASCADE,
  source_type TEXT NOT NULL DEFAULT 'file',
  title TEXT NOT NULL,
  file_url TEXT,
  file_name TEXT,
  file_size INTEGER DEFAULT 0,
  web_url TEXT,
  extracted_content TEXT,
  processing_status TEXT NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Study Blaster: study_project_messages table
CREATE TABLE public.study_project_messages (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id UUID NOT NULL REFERENCES public.study_projects(id) ON DELETE CASCADE,
  role TEXT NOT NULL,
  content TEXT NOT NULL,
  source_references JSONB DEFAULT '[]'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.study_projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_sources ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_project_messages ENABLE ROW LEVEL SECURITY;

-- RLS: study_projects
CREATE POLICY "Students view own projects" ON public.study_projects FOR SELECT USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students insert own projects" ON public.study_projects FOR INSERT WITH CHECK (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students update own projects" ON public.study_projects FOR UPDATE USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students delete own projects" ON public.study_projects FOR DELETE USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Deny anon study_projects" ON public.study_projects AS RESTRICTIVE FOR ALL TO anon USING (false) WITH CHECK (false);

-- RLS: study_sources
CREATE POLICY "Students view own sources" ON public.study_sources FOR SELECT USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students insert own sources" ON public.study_sources FOR INSERT WITH CHECK (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students update own sources" ON public.study_sources FOR UPDATE USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Students delete own sources" ON public.study_sources FOR DELETE USING (student_id IN (SELECT id FROM students WHERE user_id = auth.uid()));
CREATE POLICY "Deny anon study_sources" ON public.study_sources AS RESTRICTIVE FOR ALL TO anon USING (false) WITH CHECK (false);

-- RLS: study_project_messages
CREATE POLICY "Students view own project messages" ON public.study_project_messages FOR SELECT USING (project_id IN (SELECT id FROM study_projects WHERE student_id IN (SELECT id FROM students WHERE user_id = auth.uid())));
CREATE POLICY "Students insert own project messages" ON public.study_project_messages FOR INSERT WITH CHECK (project_id IN (SELECT id FROM study_projects WHERE student_id IN (SELECT id FROM students WHERE user_id = auth.uid())));
CREATE POLICY "Deny anon study_project_messages" ON public.study_project_messages AS RESTRICTIVE FOR ALL TO anon USING (false) WITH CHECK (false);

-- Add updated_at trigger for study_projects
CREATE TRIGGER update_study_projects_updated_at BEFORE UPDATE ON public.study_projects FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create storage bucket for study blaster files
INSERT INTO storage.buckets (id, name, public) VALUES ('study-blaster-files', 'study-blaster-files', false);

-- Storage RLS for study-blaster-files
CREATE POLICY "Students upload own study files" ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'study-blaster-files' AND auth.uid() IS NOT NULL);
CREATE POLICY "Students view own study files" ON storage.objects FOR SELECT USING (bucket_id = 'study-blaster-files' AND auth.uid() IS NOT NULL);
CREATE POLICY "Students delete own study files" ON storage.objects FOR DELETE USING (bucket_id = 'study-blaster-files' AND auth.uid() IS NOT NULL);
