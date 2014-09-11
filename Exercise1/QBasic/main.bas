DIM N_LISTS AS INTEGER
DIM LIST_STR AS STRING
DIM COLLECTIONS(255) AS INTEGER
DIM COLLECTION_INDEX AS INTEGER

DIM I AS INTEGER
DIM J AS INTEGER

COLLECTION_INDEX = 1

PRINT "HOW MANY LIST(S) ARE YOU GOING TO ENTER? "
INPUT N_LISTS

DIM MAX_COUNT AS INTEGER
DIM NUM AS INTEGER
DIM STR_LEN AS INTEGER
DIM CURR_INDEX AS INTEGER
DIM STR_TOKEN AS INTEGER
DIM IS_DUPLICATE AS INTEGER

FOR I = 1 TO N_LISTS
    PRINT "LIST " + STR$(I) + " (SPACE SEPARATED)"
    INPUT LIST_STR$

    NUM = 0
    CURR_INDEX = 1

    DO
        NUM = INSTR(NUM + 1, LIST_STR$, " ")
        STR_LEN = NUM - CURR_INDEX

        IF NUM > 0 THEN
            STR_TOKEN = VAL(MID$(LIST_STR$, CURR_INDEX, STR_LEN))
        ELSE
            STR_TOKEN = VAL(MID$(LIST_STR$, CURR_INDEX))
        END IF

        MAX_COUNT = UBOUND(COLLECTIONS)
        IS_DUPLICATE = 0
        FOR J = 1 TO MAX_COUNT
            IF STR_TOKEN = COLLECTIONS(J) THEN IS_DUPLICATE = 1
        NEXT J

        IF IS_DUPLICATE = 0 THEN
            COLLECTIONS(COLLECTION_INDEX) = STR_TOKEN
            COLLECTION_INDEX = COLLECTION_INDEX + 1
        END IF

        CURR_INDEX = NUM + 1
    LOOP UNTIL NUM = 0
NEXT I

'DO BUBBLE SORT FROM HERE
DIM MAINTAIN_A AS INTEGER
DIM REPLACE_B AS INTEGER
LET MAX_COUNT = UBOUND(COLLECTIONS)

FOR MAINTAIN_A = 1 TO MAX_COUNT
    FOR REPLACE_B = 1 TO MAX_COUNT
        IF COLLECTIONS(MAINTAIN_A) < COLLECTIONS(REPLACE_B) THEN SWAP COLLECTIONS(MAINTAIN_A), COLLECTIONS(REPLACE_B)
    NEXT REPLACE_B
NEXT MAINTAIN_A

LET RESULT$ = "RESULT: "

FOR I = 1 TO MAX_COUNT
    IF COLLECTIONS(I) > 0 THEN RESULT$ = RESULT$ + STR$(COLLECTIONS(I))
NEXT I

PRINT RESULT$
END
