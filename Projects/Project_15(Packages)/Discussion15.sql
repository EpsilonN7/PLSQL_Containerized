SET SERVEROUTPUT ON;
-- declare a VARRAY of 10 books
CREATE OR REPLACE TYPE books IS VARRAY(10) OF VARCHAR2(50);

-- put 10 books into the array
DECLARE
    ar_books books := books('Harry Potter', 'The Hobbit', '1984', 'To Kill a Mockingbird', 
                            'The Great Gatsby', 'War and Peace', 'Pride and Prejudice', 
                            'The Catcher in the Rye', 'The Lord of the Rings', 'Moby');

BEGIN
    -- iterate through the array and print each book
    FOR i IN ar_books.FIRST .. ar_books.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Book ' || i || ': ' || ar_books(i));
    END LOOP;

    -- Handle exceptions
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM(SQLCODE));

END;