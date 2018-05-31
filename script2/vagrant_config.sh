#!/usr/bin/env bash

add_a_paquet=0

echo Vous êtes maintenant connecté à votre machine virtuelle en ssh
echo Avant de commencer, procédons à une mise à jour
sudo apt update
clear
echo La mise à jour est terminée.
sleep 0.5
echo -e "Que voulez-vous faire? \n
        1: Voir la liste des VM disponibles. \n
        2: Installer des paquets.\n
        3: Sortir d'ici"
read action_choice
if [ "$action_choice" == 1 ]; then
    clear
    vagrant list
    echo -e "OK, et maintenant?
            1: Détruire le mond.. une VM. \n
            2: Quitter ce monde en perdition."
            read vm_action_choice
            if [ "$vm_action_choice" == 1 ]; then
                vagrant list
                echo Laquelle souhaites-tu détruire?
                echo Non je déconne, j\'ai pas encore eu le temps de le faire...
            elif [ "$vm_action_choice" == 2 ]; then
                echo Pas de soucis, mais je te  kick carrément, j\'ai pas fini ce script.
                sleep 1
                exit
             else
                echo Ton choix n\'est pas valide.
            fi
   fi
elif [ "$action_choice" == 2 ]; then
    echo Voici la liste des paquets installables : apache2 / php7.0 / mysql-server.
    echo 1: N\'en installer qu\'un.
    echo 2: Tous les installer.
    read choice_user
        if [ "$choice_user" = 1 ]; then
            while [ "$add_a_paquet" != "N" ];do
                echo -e "Quel paquet voulez-vous installer?
                        1: apache2 \n
                        2: php7.0 \n
                        3: mysql-server"
                read packet_choose
                if [ "$packet_choose" == 1 ]; then
                    sudo apt-install -y apache2
                    clear
                    sleep 0.5
                    echo Apache 2 installé avec succès.
                    echo Veux-tu installer un autre paquet?
                    read add_a_paquet
                    if [ "$add_a_paquet" == N ]; then
                    echo Installation terminée, tu peux éteindre votre ordinateur et aller te coucher.
                    exit
                    else
                    echo OK, continuons
                    fi
                elif [ "$packet_choose" == 2 ]; then
                    sudo apt-install -y php7.0
                    clear
                    sleep 0.5
                    echo Php7.0 installé avec succès.
                    echo Veux-tu installer un autre paquet?
                    read add_a_paquet
                    if [ "$add_a_paquet" == N ]; then
                    echo Installation terminée, tu peux éteindre votre ordinateur et aller te coucher.
                    exit
                    else
                    echo OK, continuons
                    fi
                elif [ "$packet_choose" == 3 ]; then
                    sudo apt-install -y mysql-server
                    clear
                    sleep 0.5
                    echo Mysql-server installé avec succès.
                    echo Veux-tu installer un autre paquet?
                    read add_a_paquet
                    if [ "$add_a_paquet" == N ]; then
                    echo Installation terminée, tu peux éteindre votre ordinateur et aller te coucher.
                    exit
                    else
                    echo OK, continuons
                    fi
                else
                    echo Votre choix n\'est pas valide
                fi
            done
        elif [ "$choice_user" = "2" ]; then
            sudo apt install -y apache2 php7.0 mysql-server
            clear
            sleep 0.5
            echo Installation terminée, tu peux éteindre votre ordinateur et aller te coucher.

        else
            echo  Ton choix n\'est pas valide.
        fi
elif [ "$action_choice" == 3 ]; then
    echo OK OK, pas la peine d\'être désagréable.
    sleep 5
    exit
else
    echo Ton choix n\'est pas valide.
fi
