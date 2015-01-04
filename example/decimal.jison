%lex

%%

'+'      return 'POSITIVE';
'-'      return 'NEGATIVE';
[0-9]    return 'DIGIT';
','      return 'SEP';
'.'      return 'POINT';
<<EOF>>  return 'EOF';

/lex

%%

expression
    :  signed_decimal EOF
        { console.log($1); return $1; }
    ;

signed_decimal
    : unsigned_decimal
        { $1.sign = ''; }
    | POSITIVE unsigned_decimal
        { $2.sign = ''; $$ = $2; }
    | NEGATIVE unsigned_decimal
        {
            if ($2.integer == '0' && $2.fraction == '') {
                $2.sign = ''
            } else {
                $2.sign = '-'
            }
             $$ = $2;
        }
    ;

unsigned_decimal
    : integer
        { $$ = {integer: $1, point: '', fraction: ''}; }
    | integer POINT
        { $$ = {integer: $1, point: '', fraction: ''}; }
    | fraction
        { $1.integer = '0'; }
    | integer fraction
        { $2.integer = $1; $$ = $2; }
    ;

integer
    : groups
        { $$ = $1.replace(/^0*(?=\d)/, ''); }
    ;

groups
    : lead_group
    | lead_group tail_groups
        { $$ = $1 + $2; }
    ;

lead_group
    : DIGIT
    | DIGIT DIGIT
        { $$ = $1 + $2; }
    | group_digits
    ;

tail_groups
    : tail_group
        { $$ = $1; }
    | tail_group tail_groups
        { $$ = $1 + $2; }
    ;

tail_group
    : SEP group_digits
        { $$ = $2; }
    ;

group_digits
    : DIGIT DIGIT DIGIT
        { $$ = $1 + $2 + $3; }
    ;

fraction
    : POINT fraction_digits
        {
            var frac = $2;
            frac = frac.charAt(0) + frac.slice(1).replace(/0*$/, '');
            if (frac == '0') { frac = ''; }
            var point = frac == '' ? '' : '.';
            $$ = { point: point, fraction: frac };
        }
    ;

fraction_digits
    : DIGIT
    | DIGIT fraction_digits
        { $$ = $1 + $2; }
    ;

