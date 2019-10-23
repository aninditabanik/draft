The script has been prepared based on the quip doc https://salesforce.quip.com/DoATAY0BaoWn#XcaACA9nNwz

To run the seed script see below:
1. Open postgres terminal and connect to payments db
2. To install the uuid-ossp module, you use the CREATE EXTENSION statement as follows
   ```
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    ```
3. Execute Portal_seed_script.sql
4. Clean up data first 
   ```
    CALL portal_cleanup();
    ```
5. Run the seed procedure  
   ```
    CALL portal_seed();
    ```

