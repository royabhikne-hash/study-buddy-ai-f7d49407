
-- ERROR 1: Prevent students from modifying sensitive fields via trigger
DROP POLICY IF EXISTS "Students can update own data" ON public.students;

CREATE POLICY "Students can update own safe fields"
ON public.students FOR UPDATE TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE OR REPLACE FUNCTION public.prevent_student_sensitive_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.is_approved := OLD.is_approved;
  NEW.is_banned := OLD.is_banned;
  NEW.approved_by := OLD.approved_by;
  NEW.approved_at := OLD.approved_at;
  NEW.rejection_reason := OLD.rejection_reason;
  NEW.student_type := OLD.student_type;
  NEW.school_id := OLD.school_id;
  NEW.coaching_center_id := OLD.coaching_center_id;
  NEW.user_id := OLD.user_id;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS prevent_student_sensitive_update_trigger ON public.students;
CREATE TRIGGER prevent_student_sensitive_update_trigger
  BEFORE UPDATE ON public.students
  FOR EACH ROW
  EXECUTE FUNCTION public.prevent_student_sensitive_update();

-- ERROR 3: Fix overly permissive ALL policies on weekly_tests, mcq_attempts, subscriptions, upgrade_requests
DROP POLICY IF EXISTS "Deny anonymous access to weekly_tests" ON public.weekly_tests;
CREATE POLICY "Deny all default access to weekly_tests"
ON public.weekly_tests FOR ALL TO public
USING (false)
WITH CHECK (false);

DROP POLICY IF EXISTS "Deny anonymous access to mcq_attempts" ON public.mcq_attempts;
CREATE POLICY "Deny all default access to mcq_attempts"
ON public.mcq_attempts FOR ALL TO public
USING (false)
WITH CHECK (false);

DROP POLICY IF EXISTS "Deny anonymous access to subscriptions" ON public.subscriptions;
CREATE POLICY "Deny all default access to subscriptions"
ON public.subscriptions FOR ALL TO public
USING (false)
WITH CHECK (false);

DROP POLICY IF EXISTS "Deny anonymous access to upgrade requests" ON public.upgrade_requests;
CREATE POLICY "Deny all default access to upgrade_requests"
ON public.upgrade_requests FOR ALL TO public
USING (false)
WITH CHECK (false);

-- WARNING 5: Fix student photo storage - restrict uploads to own folder only
DROP POLICY IF EXISTS "Students can upload own photo" ON storage.objects;
DROP POLICY IF EXISTS "Students can update own photo" ON storage.objects;
DROP POLICY IF EXISTS "Students can delete own photo" ON storage.objects;
DROP POLICY IF EXISTS "Anyone can view student photos" ON storage.objects;
DROP POLICY IF EXISTS "student_photos_upload" ON storage.objects;
DROP POLICY IF EXISTS "student_photos_update" ON storage.objects;
DROP POLICY IF EXISTS "student_photos_delete" ON storage.objects;
DROP POLICY IF EXISTS "student_photos_select" ON storage.objects;

CREATE POLICY "student_photos_select"
ON storage.objects FOR SELECT TO public
USING (bucket_id = 'student-photos');

CREATE POLICY "student_photos_insert_own"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'student-photos' 
  AND (storage.foldername(name))[1] = auth.uid()::text
);

CREATE POLICY "student_photos_update_own"
ON storage.objects FOR UPDATE TO authenticated
USING (
  bucket_id = 'student-photos' 
  AND (storage.foldername(name))[1] = auth.uid()::text
);

CREATE POLICY "student_photos_delete_own"
ON storage.objects FOR DELETE TO authenticated
USING (
  bucket_id = 'student-photos' 
  AND (storage.foldername(name))[1] = auth.uid()::text
);
