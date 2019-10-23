
CREATE OR REPLACE PROCEDURE portal_seed()
LANGUAGE plpgsql
AS $$

DECLARE
    this_payment_txn_id uuid = uuid_generate_v4();
    this_merchant_id uuid = '47b70ca4-0f6e-4c52-819f-667ae804f9d2';
    this_payment_intent_id uuid = uuid_generate_v4();
    this_api_user_id uuid = 'cd86ff2e-fa0f-4bbc-92dd-0f0fde10e8cf';
    this_payment_source_token_id uuid = '98e11d34-4519-4668-b09d-85a3c6765989';

    customer1_first_name VARCHAR = 'Barbara'; 
    customer1_last_name VARCHAR = 'Rich'; 
    customer1_email VARCHAR = 'BRich'; 
    customer1_id uuid = uuid_generate_v4();

    customer2_name VARCHAR = 'Kevin Casanova';
    customer2_email VARCHAR = 'KevinC'; 
    customer2_id uuid = uuid_generate_v4();

    customer3_name VARCHAR = 'Linda Wilcox';
    customer3_email VARCHAR = 'Linda.Wilcox'; 
    customer3_id uuid = uuid_generate_v4();

    customer4_name VARCHAR = 'Patricia Hooper';
    customer4_email VARCHAR = 'PatriciaHooper'; 
    customer4_id uuid = uuid_generate_v4();

    customer5_name VARCHAR = 'Sam Nelson';
    customer5_email VARCHAR = 'NelsonS'; 
    customer5_id uuid = uuid_generate_v4();

BEGIN

ALTER TABLE "payments"."payment_txn" DISABLE TRIGGER ALL;
ALTER TABLE "payments"."payment_intent" DISABLE TRIGGER ALL;

-- create payments   
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2018-10-31', 10000, 'Payment', 'captured');   
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2018-10-31', 10000, 'Refund', 'refunded');   
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2018-12-30', 94000, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-01-10', 27000, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-02-02', 1000, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-03-15', 40300, 'Payment', 'canceled');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-04-30', 678900, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-04-30', 678900, 'Refund', 'refunded');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-05-15', 32000, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-06-11', 1000000, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-07-24', 1000000, 'Payment', 'pending');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-09-23', 100, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-09-30', 6700, 'Payment', 'captured');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-10-10', 6700, 'Refund', 'refunded');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-10-20', 50500, 'Payment', 'pending');
PERFORM create_payment(customer1_email,customer1_first_name, customer1_last_name, '2019-10-30', 40400, 'Payment', 'canceled');

/*

*/

COMMIT;

ALTER TABLE "payments"."payment_txn" ENABLE TRIGGER ALL;
ALTER TABLE "payments"."payment_intent" ENABLE TRIGGER ALL;

END;
$$;

