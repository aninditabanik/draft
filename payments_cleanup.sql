CREATE OR REPLACE PROCEDURE portal_cleanup()
LANGUAGE plpgsql
AS $$


BEGIN

--ALTER TABLE "payments"."customer" DISABLE TRIGGER ALL;
ALTER TABLE "payments"."payment_txn" DISABLE TRIGGER ALL;
ALTER TABLE "payments"."payment_intent" DISABLE TRIGGER ALL;

--DELETE FROM "payments"."customer" WHERE "remote_created_by"= 'portal_user';

DELETE FROM "payments"."payment_txn" WHERE "remote_created_by"= 'portal_user';

DELETE FROM "payments"."payment_intent" WHERE "remote_created_by"= 'portal_user';

COMMIT;

ALTER TABLE "payments"."payment_txn" ENABLE TRIGGER ALL;
ALTER TABLE "payments"."payment_intent" ENABLE TRIGGER ALL;

END;
$$;


