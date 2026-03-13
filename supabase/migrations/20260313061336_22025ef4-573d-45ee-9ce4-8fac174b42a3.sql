CREATE OR REPLACE FUNCTION public.create_basic_subscription()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
BEGIN
  INSERT INTO public.subscriptions (student_id, plan, start_date, is_active, tts_limit)
  VALUES (NEW.id, 'basic', now(), true, 0);
  RETURN NEW;
END;
$function$;