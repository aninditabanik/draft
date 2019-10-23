CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CALL portal_cleanup();
CALL portal_seed();
