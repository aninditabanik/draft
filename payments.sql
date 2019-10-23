select * from payments.merchant

DESC TABLE "payments"."payment_txn"



INSERT INTO "payments"."payment_txn"("id", "created_by", "modified_by", "created_at", "modified_at", "channel_created_by", "channel_modified_by", "transaction_type", "merchant_id", "payment_source_token_id", "currency_code", "amount", "payment_date", "salesforce_platform_fee_amount", "permission_to_publish", "statement_descriptor", "captured_at", "customer_id", "payment_intent_id", "adjusts_original_transaction", "customer_visible_transaction_number", "gateway_transaction_number", "version") 
                            VALUES('526313be-a886-45b8-964b-99d42bfbb388', 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', '2019-10-22 12:01:12.94-07', '2019-10-22 12:01:12.94-07', 'GIVING_FORMS', 'GIVING_FORMS', 'Payment', '47b70ca4-0f6e-4c52-819f-667ae804f9d2', '98e11d34-4519-4668-b09d-85a3c6765989', 'USD', 1000, '2019-10-22', 0, '3', 'Test Merchant for Spreedly ac70-32ef-41b1-9d32', '2019-10-22 12:01:12-07', 'a39e783f-bb18-4227-8fe2-a22bee9c2859', '59bcf1ca-d02a-4f0d-a02b-42f4c4276178', 'FALSE', 'ac70-32ef-41b1-9d32', 'KkDvpML1DY8XoiwTdw0js08TZYD', 0)


//30e54f84-153b-4d09-9ece-74638643ba58

CREATE OR REPLACE PROCEDURE portal_seed()
LANGUAGE plpgsql
AS $$

DECLARE
    this_payment_txn_id uuid = uuid_generate_v4();
    this_merchant_id uuid = '47b70ca4-0f6e-4c52-819f-667ae804f9d2';
    this_customer_id uuid = 'a39e783f-bb18-4227-8fe2-a22bee9c2859';
    this_payment_intent_id uuid = uuid_generate_v4();

BEGIN
    -- creates a payment  
INSERT INTO "payments"."payment_txn"("id", "remote_created_by","created_by", "modified_by", "created_at", "modified_at", "channel_created_by", "channel_modified_by", "transaction_type", "merchant_id", "payment_source_token_id", "currency_code", "amount", "payment_date", "salesforce_platform_fee_amount", "permission_to_publish", "statement_descriptor", "captured_at", "customer_id", "payment_intent_id", "adjusts_original_transaction", "customer_visible_transaction_number", "gateway_transaction_number", "version") 
VALUES(this_payment_txn_id, 'portal_user','cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', '2019-10-22 12:01:12.94-07', '2019-10-22 12:01:12.94-07', 'GIVING_FORMS', 'GIVING_FORMS', 'Payment', this_merchant_id, '98e11d34-4519-4668-b09d-85a3c6765989', 'USD', 5000, '2019-10-22', 0, '3', 'Test Merchant for Spreedly ac70-32ef-41b1-9d32', '2019-10-22 12:01:12-07', this_customer_id, '59bcf1ca-d02a-4f0d-a02b-42f4c4276178', 'FALSE', 'ac70-32ef-41b1-9d32', 'KkDvpML1DY8XoiwTdw0js08TZYD', 0);

 
INSERT INTO "payments"."payment_intent"("id","remote_created_by", "created_by", "modified_by", "created_at", "modified_at", "channel_created_by", "channel_modified_by", "transaction_type", "merchant_id", "currency_code", "amount", "status", "salesforce_platform_fee_factor", "payment_date", "payment_dated_at", "customer_id", "payment_source_token_id", "amount_capturable", "resulting_transaction_id", "metadata_id", "version") 
VALUES(this_payment_intent_id, 'portal_user','cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf', '2019-10-22 12:01:12.854-07', '2019-10-22 12:01:12.959-07', 'GIVING_FORMS', 'GIVING_FORMS', 'Payment', '47b70ca4-0f6e-4c52-819f-667ae804f9d2', 'USD', 1000, 'captured', 0, '2019-10-22', '2019-10-22 12:01:11.816-07', 'a39e783f-bb18-4227-8fe2-a22bee9c2859', '98e11d34-4519-4668-b09d-85a3c6765989', 1000, this_payment_txn_id, 'dab7cdc1-c6e1-46f0-98a4-13a5527696ac', 1);
    
UPDATE "payments"."payment_txn" SET "payment_intent_id"= this_payment_intent_id WHERE "id"= this_payment_txn_id;  
    COMMIT;
END;
$$;

 CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CALL portal_seed();