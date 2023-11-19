#!/bin/bash

# Viser en liste over almindelige brugere på systemet
clear
echo "User in system:"
awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd
echo

# Spørger hvad brugeren ønsker at gøre
echo "What do you like to do? :"
echo "1. Add new user"
echo "2. Delete user"
echo "3. Change user"
echo "4. Exit"
read -p "Enter choise (1-4): " ACTION

case $ACTION in
    1)  # Tilføjelse af ny bruger
        clear
        read -p "Enter new user name: " NEW_USER
        read -sp "Enter password for new user : " NEW_PASSWORD
        sudo adduser $NEW_USER --gecos "" --disabled-password
        sudo chpasswd <<<"$NEW_USER:$NEW_PASSWORD"
        read -p "Do you like to add new user til sudo? (Y/n)" LIKETOADD
        if [ "$LIKETOADD" == "Y" ] || [ "$LIKETOADD" == "y" ]; then
           sudo usermod -aG sudo $NEW_USER
           echo "New user, $NEW_USER, has been created, and added to sudo"
        else
           echo "New user, $NEW_USER created, but not added to sudo"
        fi
        ;;
    2)  # Sletning af en bruger
        read -p "Enter name on user that you like to delete: " DELETE_USER
        if [ "$DELETE_USER" == "mcs" ]; then
           echo "mcs user can not be deleted, it is needed for support. "
        else
        sudo deluser --remove-home $DELETE_USER
        echo "User has been deleted: $DELETE_USER"
        fi
        ;;
    3)  # Ændring af en eksisterende bruger
        read -p "Indtast navnet på brugeren, du vil ændre: " MODIFY_USER
        echo "Vælg en ændring for $MODIFY_USER:"
        echo "a. Ændre adgangskode"
        echo "b. Tilføje til sudo-gruppen"
        read -p "Indtast dit valg (a/b): " MODIFY_CHOICE
        case $MODIFY_CHOICE in
            a)
                read -sp "Indtast ny adgangskode: " NEW_PASS
                echo $NEW_PASS | sudo passwd $MODIFY_USER --stdin
                echo "Adgangskode ændret for $MODIFY_USER"
                ;;
            b)
                sudo usermod -aG sudo $MODIFY_USER
                echo "$MODIFY_USER tilføjet til sudo-gruppen"
                ;;
            *)
                echo "Ugyldigt valg."
                ;;
        esac
        ;;
    4)  # Afslutter scriptet
        echo "Exiting program."
        ;;

esac
