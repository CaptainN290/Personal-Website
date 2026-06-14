
CREATE TABLE IF NOT EXISTS email_subscribers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  subscribed_at timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE email_subscribers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "insert_subscriber" ON email_subscribers FOR INSERT
  TO anon WITH CHECK (true);

CREATE POLICY "select_own_subscriber" ON email_subscribers FOR SELECT
  TO anon USING (true);
