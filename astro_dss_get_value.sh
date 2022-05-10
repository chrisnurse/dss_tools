VALUE=$(cat $1 | tr "\r\n" "\n" | grep "$2" | sed "s/$2 = //")
echo "$VALUE"
