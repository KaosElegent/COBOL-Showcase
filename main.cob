       IDENTIFICATION DIVISION.
       PROGRAM-ID. "TESTPRG".
       AUTHOR. SHREY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME PIC X(25).

       PROCEDURE DIVISION.
           DISPLAY "Enter your name: " With No Advancing.
           ACCEPT WS-NAME.
           DISPLAY "Hey " WS-NAME.
           STOP RUN.
