Date() {
    x=$(date +%D)
    echo $x
}

Time() {
    x=$(date '+%I:%M %p')
    echo $x
}

Batt() {
    x=$(cat /sys/class/power_supply/BAT1/capacity)
    echo "BAT $x"
}

Bar() {
    echo " [ $(Batt) ] [ $(Time) ] [ $(Date) ] "
}

while :
do
    sleep 1
    xsetroot -name "$(Bar)"
done

