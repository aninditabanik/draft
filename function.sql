CREATE FUNCTION create_payment(this_customer_id uuid, created_at timestamptz, amount unsigned_bigint, ) 
RETURNS integer AS $$
BEGIN
RETURN val + 1;
END; $$
LANGUAGE PLPGSQL;