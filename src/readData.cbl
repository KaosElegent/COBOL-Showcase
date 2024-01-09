       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEQREAD.
       AUTHOR. SHREY.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO 'data'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLOYEE-FILE.
       01 EMPLOYEE-RECORD.
           05 E-ID PIC 9(8).
           05 E-NAME PIC X(25).
           05 E-CITY PIC X(20).
           05 E-SALARY PIC 9(6).
       
       WORKING-STORAGE SECTION. 
       01 WS-EMPLOYEE.
           05 WS-ID PIC 9(8).
           05 WS-NAME PIC X(25).
           05 WS-CITY PIC X(20).
           05 WS-SALARY PIC 9(6).
       01 WS-EOF PIC A(1).

       01 WS-INPUT-CHOICE.
           05 WS-USERINPUT PIC S9(1) VALUE -1.
           05 WS-USEREXTRA-1 PIC X(79).
               88 input-is-ok-1 VALUE space.
       
       01 WS-INPUT-CITY.
           05 WS-USERCITY PIC X(20).
           05 WS-USEREXTRA-2 PIC X(60).
              88 input-is-ok-2 VALUE space.
       01 WS-MEANSALARY PIC 9(7)v9(2) VALUE 0.
       01 WS-DISPMEANSALARY PIC $(3),$(3).99.

       PROCEDURE DIVISION.
       main section.
           PERFORM UI WITH TEST AFTER UNTIL WS-USERINPUT=0.
           STOP RUN.
       
       UI section.
       display-menu.
           DISPLAY "SELECT AN OPTION:".
           DISPLAY "1) Display all records".
           DISPLAY "2) Display the mean salary for a city".
           DISPLAY "0) Exit".
           DISPLAY "(1/2/0): " WITH NO ADVANCING.
           ACCEPT WS-INPUT-CHOICE.

       choices.
           EVALUATE TRUE
           WHEN WS-USERINPUT NUMERIC AND input-is-ok-1
               EVALUATE TRUE
                   WHEN WS-USERINPUT=1
                       PERFORM display-all
                   WHEN WS-USERINPUT=2
                       PERFORM display-mean
                   WHEN WS-USERINPUT=0
                       PERFORM end-run
                   WHEN OTHER
                       DISPLAY "INVALID INPUT!"
                       DISPLAY " "
               END-EVALUATE
           WHEN OTHER
               DISPLAY "INVALID INPUT!"
               DISPLAY " "
           END-EVALUATE.

       actions section.
       display-all.
           OPEN INPUT EMPLOYEE-FILE
               PERFORM UNTIL WS-EOF='Y'
               READ EMPLOYEE-FILE INTO WS-EMPLOYEE
                   AT END MOVE 'Y' TO WS-EOF
                   NOT AT END DISPLAY WS-EMPLOYEE
               END-READ
               END-PERFORM
               MOVE 'N' TO WS-EOF
           CLOSE EMPLOYEE-FILE
           DISPLAY " ".

       display-mean.
           DISPLAY "Enter a city name (0 to Exit): " WITH NO ADVANCING
           ACCEPT WS-INPUT-CITY
              
           EVALUATE TRUE
           WHEN input-is-ok-2
               EVALUATE TRUE
               WHEN NOT WS-USERCITY='0'
                 OPEN INPUT EMPLOYEE-FILE
                 PERFORM UNTIL WS-EOF='Y'
                 READ EMPLOYEE-FILE INTO WS-EMPLOYEE
                     AT END MOVE 'Y' TO WS-EOF
                     NOT AT END
                     IF WS-USERCITY=WS-CITY
                     COMPUTE WS-MEANSALARY=(WS-MEANSALARY+WS-SALARY)/2
                     END-IF
                 END-READ
                 END-PERFORM
                 MOVE 'N' TO WS-EOF
                 CLOSE EMPLOYEE-FILE
                 EVALUATE TRUE
                 WHEN WS-MEANSALARY=0
                    DISPLAY "Mean salary is zero!" WITH NO ADVANCING
                    DISPLAY "(Maybe no records found with such city"
                    DISPLAY " "
                 WHEN OTHER
                    MOVE WS-MEANSALARY TO WS-DISPMEANSALARY
                    DISPLAY "Mean Salary for " WITH NO ADVANCING
                    DISPLAY WS-USERCITY " is " WS-DISPMEANSALARY
                    DISPLAY " "
                    MOVE 0 TO WS-MEANSALARY
                 END-EVALUATE
               END-EVALUATE
           WHEN OTHER
               DISPLAY "INVALID INPUT!"
               DISPLAY " "
               GO TO display-mean
           END-EVALUATE.
       
       end-run.
           DISPLAY "Thank You for using the program!"
           STOP RUN.
       




           
