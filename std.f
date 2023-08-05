
: ( immediate begin word ")" = until ;


( The standard library of words for Sorth. )

( Simple increment and decrements. )
: ++ ( value -- incremented ) 1 + ;
: -- ( value -- decremented ) 1 - ;


( Lets save some typing. )
: .cr  ( value -- ) . cr ;
: ?    ( value -- ) @ .cr ;
: .sp  ( count -- ) begin -- dup 0 >= while "" . repeat drop ;


( Handy comparisons. )
: 0>  ( value -- test_result ) 0 >  ;
: 0=  ( value -- test_result ) 0 =  ;
: 0<  ( value -- test_result ) 0 <  ;
: 0>= ( value -- test_result ) 0 >= ;
: 0<= ( value -- test_result ) 0 <= ;


: +! ( value variable -- ) over @ + swap ! ;
: -! ( value variable -- ) over @ - swap ! ;


( Alternate ways to exit the interpreter. )
: q    ( -- ) quit ;
: exit ( -- ) quit ;
