#!/usr/bin/awk -f
BEGIN {
    OFS="\t"
    chr="NA"
}
{
    if (NR==FNR){
        size_arr[$1] = $2
    } else {
        if ($1 ~ /^[^#]/){
            c++
            if (chr=="NA"){
                chr=$1
                start=1
            }
            if (chr==$1){
                print chr, "GATC", "exon", start, $4, ".", ".", ".", pattern chr "." c
                start=$3
            } else {
                print chr, "GATC", "exon", start, size_arr[chr], ".", ".", ".", pattern chr "." c
                start=1
                chr=$1
            }
        }
    }
}
END{
    c++
    print chr, "GATC", "exon", start, size_arr[chr], ".", ".", ".", pattern chr "." c
}
