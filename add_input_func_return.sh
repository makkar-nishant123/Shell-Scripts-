function Add()
{
read a
read b
c=`expr $a + $b`
echo $c
}

value=$(Add)
echo $value
