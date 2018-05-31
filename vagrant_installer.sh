#!/usr/bin/env bash
launch=0
validation_response=0
vm_base_final_response=0

while [ "$launch" != "O" ]; do
    echo Bonjour, bienvenue dans la configuration de Vagrant et Virtual Box.
    sleep 1
    echo Vagrant est téléchargé sur ce poste? O / N
    read vagrant_preinstall_response
    if [ "$vagrant_preinstall_response" == "O" ]; then
        echo VMbox est téléchargé sur ce poste? O / N
        read vmbox_preinstall_response
        if [ "$vmbox_preinstall_response" == "O" ]; then
        clear
        echo Très bien, c\'est parfait. passons maintenant à la configuration de notre machine virtuelle.
        echo Quelle VM veux-tu utiliser?
        echo 1: ubuntu/xenial64
        echo 2: ubuntu/xenial64
        echo 3: ubuntu/xenial64
        read vm_base_response
    if [ "$vm_base_response" == "1" ];then
        vm_base_final_response="ubuntu/xenial64"
    elif [ "$vm_base_response" == "2" ];then
        vm_base_final_response="ubuntu/xenial64"
    else
        vm_base_final_response="ubuntu/xenial64"
    fi
    echo Comment veux-tu appeler le dossier synchronisé?
    read synced_folder_response
    echo "Quelle adresse IP souhaites-tu utiliser (seulement les 2 derniers chiffres)?"
    read ip_adress
    echo Valider ces 3 informations? "$vm_base_final_response", "$synced_folder_response" et "192.168.33.$ip_adress"? ?
    echo O / N
    read validation_response

    if  [ "$validation_response" == "O" ]; then
        clear
        echo "
        Vagrant.configure(\"2\") do |config|
        config.vm.box = \"$vm_base_final_response\"
        config.vm.network \"private_network\", ip: \"192.168.33.$ip_adress\"
        config.vm.synced_folder \"./$synced_folder_response\", \"/var/www/html\", type: \"virtualbox\"end" > Vagrantfile;
        mkdir $synced_folder_response;
    else
        exit
    fi
     mv ./script2/vagrant_config.sh $synced_folder_response
     rm -rf ./script2
    echo La machine virtuelle est prête à être lancée. Commencer? O / N
    read launch
    echo "Une fois connecté, veuillez rentrer les commandes suivantes 'cd /var/www/html' puis 'bash vagrant_config.sh'"
    sleep 5
    vagrant plugin install vagrant-list
    vagrant up
    vagrant ssh
        elif [ "$vmbox_preinstall_response" == "N" ]; then

            echo Désolé, veuillez vous rendre à l\'adresse suivante pour le télécharger, puis relancer le script.
            echo  https://download.virtualbox.org/virtualbox/5.2.12/virtualbox-5.2_5.2.12-122591~Debian~jessie_amd64.deb
            sleep 1
            break
        else
            echo Désolé, votre choix n\'est pas valide. Veuillez répondre par O pour oui, ou N pour non.
        fi
    elif [ "$vagrant_preinstall_response" == "N" ]; then
        echo Remedions à cela...
        vagrant init
        echo Tu peux relancer le script maintenant.
        sleep 1
        break
    else
       echo Désolé, votre choix n\'est pas valide. Veuillez répondre par O pour oui, ou N pour non.
    fi
done