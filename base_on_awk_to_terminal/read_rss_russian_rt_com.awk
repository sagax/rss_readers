BEGIN {
    FS="<title>|</title>|<description>|</description>";
} /title|description/ {
    i=1
    while ( i <= NF ) {
        if ( $i ~ /<!\[CDATA\[/ ) {
            str = $i
            sub( /<!\[CDATA\[/, "", str)
            sub( /\]\]>/, "", str)
            sub( /\s<a href="/, "\n\033[94m\n", str )
            sub( /">Читать далее<\/a>/, "\033[0m\n", str)
            print "\033[40m\n"str"\033[0m"
        } else if( $i ~ /^$/ ) {
        } else {
            print "\033[44m\n   "$i"\n\033[0m"
        }
        ++i
    }
}
