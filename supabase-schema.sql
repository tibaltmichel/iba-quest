-- Run this in Supabase SQL Editor once for IBA Quest cloud save.
create table if not exists public.cocktail_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  progress jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.cocktail_progress enable row level security;
create policy "Users can read own cocktail progress" on public.cocktail_progress
  for select to authenticated using (auth.uid() = user_id);
create policy "Users can insert own cocktail progress" on public.cocktail_progress
  for insert to authenticated with check (auth.uid() = user_id);
create policy "Users can update own cocktail progress" on public.cocktail_progress
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
