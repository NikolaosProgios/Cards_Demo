
mysqldump adise19_chess1 -u root -R  > schema.sql
"E:\Program Files\Git\usr\bin\sed.exe" -i -r "s/DEFINER=`[^`]*`@`[^`]*`//g" schema.sql

REM  Η παραπάνω εντολή παίρνει backup και επιπλέον από το αρχείο διαγράφει το "DEFINER"
REM που βάζει το mysqldump στις procedures/trigger.
REM To definer ενδεχομένως δημιουργήσει πρόβλημα στο restore σε ένα διαφορετικό σύστημα
REM μέ άλλους χρήστες.

