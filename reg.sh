# GNU versions of sed and awk can use "+",
# but it needs to be escaped.

echo a111b | sed -ne '/a1\+b/p'
echo a111b | grep 'a1\+b'
echo a111b | awk '/a1+b/'
# All of above are equivalent.
# Thanks, S.C.
