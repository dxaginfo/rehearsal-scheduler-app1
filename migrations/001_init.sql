-- Migration: Initial DB schema for Rehearsal Scheduler
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(120) UNIQUE NOT NULL,
  hashed_password TEXT NOT NULL,
  role VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  location VARCHAR(200),
  notes TEXT
);
CREATE TABLE participants (
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20),
  PRIMARY KEY (rehearsal_id, user_id)
);
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  type VARCHAR(32),
  sent_at TIMESTAMP,
  status VARCHAR(32)
);