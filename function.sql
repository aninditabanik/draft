CREATE OR REPLACE FUNCTION create_payment(customer_email varchar(100),
                                            customer_first_name varchar(100),
                                            customer_last_name varchar(100),
                                            this_created_at timestamptz, 
                                            this_amount payments.unsigned_bigint, 
                                            this_transaction_type varchar(200),
                                            this_status varchar(200)
                                        ) 
RETURNS void AS $$

DECLARE
    this_payment_txn_id uuid = uuid_generate_v4();
    this_merchant_id uuid = '47b70ca4-0f6e-4c52-819f-667ae804f9d2';
    this_payment_intent_id uuid = uuid_generate_v4();
    this_api_user_id uuid = 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf';
    this_payment_source_token_id uuid = '98e11d34-4519-4668-b09d-85a3c6765989';

BEGIN
-- creates a payment  

INSERT INTO "payments"."payment_txn"("id", "created_by", "modified_by", "created_at", "modified_at", "remote_created_by", "channel_created_by", "channel_modified_by", "transaction_type", "merchant_id", "payment_source_token_id", "currency_code", "amount", "payment_date", "salesforce_platform_fee_amount", "permission_to_publish", "statement_descriptor", "captured_at", "payment_intent_id", "adjusts_original_transaction", "customer_visible_transaction_number", "gateway_transaction_number", "version") 
VALUES(this_payment_txn_id, this_api_user_id, this_api_user_id, this_created_at, this_created_at, 'portal_user', 'GIVING_FORMS', 'GIVING_FORMS', this_transaction_type, this_merchant_id, '98e11d34-4519-4668-b09d-85a3c6765989', 'USD', this_amount, this_created_at, 0, '3', 'Test Merchant for Spreedly ac70-32ef-41b1-9d32', this_created_at, this_payment_intent_id, 'FALSE', 'ac70-32ef-41b1-9d32', 'KkDvpML1DY8XoiwTdw0js08TZYD', 0);

INSERT INTO "payments"."payment_intent"("id", "created_by", "modified_by", "created_at", "modified_at", "remote_created_by", "channel_created_by", "channel_modified_by", "transaction_type", "merchant_id", "currency_code", "amount", "status", "salesforce_platform_fee_factor", "statement_descriptor", "payment_date", "payment_dated_at", "payment_source_token_id", "version", "email", "first_name", "last_name") 
VALUES(this_payment_intent_id, this_api_user_id, this_api_user_id, this_created_at, this_created_at, 'portal_user', 'GIVING_FORMS', 'GIVING_FORMS', 'Payment', this_merchant_id, 'USD', this_amount, this_status, 0, 'Test Merchant for Spreedly ac70-32ef-41b1-9d32', this_created_at, this_created_at, '98e11d34-4519-4668-b09d-85a3c6765989', 1, customer_email, customer_first_name, customer_last_name);

UPDATE "payments"."payment_txn" SET "payment_intent_id"= this_payment_intent_id WHERE "id"= this_payment_txn_id;  

END; $$
LANGUAGE PLPGSQL;