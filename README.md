# The IBA Quest — GitHub Pages + cloud sync

A static checklist for tasting the 101 cocktails in the IBA collection. GitHub Pages hosts the site; Supabase Auth and Postgres keep each user's progress private and synced across devices.

## 1. Publish on GitHub Pages
1. Create a GitHub repository (for example `iba-quest`).
2. Upload `index.html` and `supabase-schema.sql` (or upload the entire folder contents).
3. In repository **Settings → Pages**, set **Deploy from a branch**, branch `main`, folder `/ (root)`, then Save.
4. Wait for GitHub Pages to publish your `https://YOUR-USERNAME.github.io/iba-quest/` site.

## 2. Create Supabase cloud database
1. Create a free project at https://supabase.com/.
2. Open **SQL Editor**, paste the contents of `supabase-schema.sql`, and run it.
3. Open **Project Settings → API** and copy the **Project URL** and **anon / publishable key**. Never use the service-role secret in this browser app.
4. On your site, open the Cloud save setup section and paste those two values, then click **Connect and save settings**.
5. Create an account with email and password. If email verification is enabled, confirm the email and then sign in.

## How saving works
- While signed in, the app syncs your progress to the `cocktail_progress` table.
- Supabase Row Level Security restricts each account to its own row.
- Local browser storage is also used as a cache/offline fallback.
- Export your data using the Export button for an extra backup.

## Important security note
The Supabase URL and anon/publishable key are public browser configuration, not secrets. The SQL policies are essential; do not disable Row Level Security or put the service-role key in this website.

## Troubleshooting
- If you see `relation cocktail_progress does not exist`, rerun the SQL file in Supabase SQL Editor.
- If the site doesn't load Supabase, check that you pasted the project URL and anon/publishable key correctly.
- If account creation asks for email verification, verify first, then use Sign in.
- A free Supabase project may pause if inactive; export a JSON backup occasionally.
