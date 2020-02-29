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
    DATA lt_characters TYPE STANDARD TABLE OF string.

    ASSERT out IS BOUND.

    CONDENSE sentence.
    SPLIT sentence AT space INTO TABLE DATA(lt_words).
    out->write( |Number of words { lines( lt_words ) }| ).
    LOOP AT lt_words INTO DATA(ld_word).
      CLEAR lt_characters.
      data(i) = 0.
      DO strlen( ld_word ) TIMES.
        COLLECT ld_word+i(1) INTO lt_characters.
        i = i + 1.
      ENDDO.
      out->write( |Number of unique characteres in the word: { ld_word } - { lines( lt_characters ) }| ).
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
