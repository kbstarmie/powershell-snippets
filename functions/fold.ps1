function foldl {
    param(
        $baseValue, $f, $list
    )

    if ($list.length -gt 1) {
        foldl $(& $f $baseValue $list[0]) $f $list[1..$($list.length)]
    } else { 
        & $f $baseValue $list[0]
    }
}

function foldr {
    param($baseValue, $f, $list)

    if ($list.length -gt 0) {
        & $f $list[0] (foldr -f $f -baseValue $baseValue -list $list[1..($list.length)])
    } else {
        $baseValue
    }
}
