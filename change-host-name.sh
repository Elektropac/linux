#!/bin/bash

# Henter det aktuelle maskinnavn
CURRENT_HOSTNAME=$(hostname)
clear
echo "Dette program skal køres på den terminal som du ønsker at lave opsætning på,"
echo -e "det vil sige at du skal være logget på med en ssh terminal\n"
# Spørger om brugeren vil ændre maskinnavnet
echo "Lad os ændre terminal navn!"
echo "Den aktuelle terminal hedder '$CURRENT_HOSTNAME'. "
echo "Du kan tilføje til dette navn, dette gør det nemmere for alle at kunne lokalisere terminalen senere"
echo "Navnet vil altid være 'Sapphire2_' det navn du tilføjer vil blive tilføjet til dette navn"
echo "Ønsker du at ændre maskinnavnet? (ja/nej)"


read CHANGE_HOSTNAME

if [ "$CHANGE_HOSTNAME" = "ja" ]; then
    # Spørger om det nye maskinnavn og ændrer det
    read -p "Indtast det nye maskinnavn: " NEW_HOSTNAME
    # Tilføjer præfikset "Sapphire2_" foran det valgte navn
    FULL_NEW_HOSTNAME="Sapphire2-$NEW_HOSTNAME"
    sudo hostnamectl set-hostname $FULL_NEW_HOSTNAME
    echo "Maskinnavnet er blevet ændret til '$FULL_NEW_HOSTNAME'."
fi
