create table if not exists public.recipes (
  id text primary key,
  title text not null,
  category text not null,
  description text not null,
  time text not null,
  ingredients text[] not null default '{}'::text[],
  steps text[] not null default '{}'::text[],
  photo_data_url text not null default '',
  created_at timestamptz not null default now()
);

alter table public.recipes enable row level security;

drop policy if exists "Public read recipes" on public.recipes;
create policy "Public read recipes"
on public.recipes
for select
using (true);

drop policy if exists "Public insert recipes" on public.recipes;
create policy "Public insert recipes"
on public.recipes
for insert
with check (true);
