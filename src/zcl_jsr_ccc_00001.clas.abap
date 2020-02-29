CLASS zcl_jsr_ccc_00001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jsr_ccc_00001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(sentence) = `ABАP  is excellent `.
    DATA lt_characters TYPE SORTED TABLE OF string WITH NON-UNIQUE KEY table_line.
    CONDENSE sentence.
    SPLIT sentence AT space INTO TABLE DATA(lt_words).
    out->write( |Number of words { lines( lt_words ) }| ).
    LOOP AT lt_words INTO DATA(ld_word).
      lt_characters  = VALUE #( FOR j = 0 WHILE ( j <= strlen( ld_word ) - 1 ) (  ld_word+j(1)  ) ).
      delete ADJACENT DUPLICATES FROM lt_characters.
      out->write( |Number of unique characteres in the word: { ld_word } - { lines( lt_characters ) }| ).
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
