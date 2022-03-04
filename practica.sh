#!/bin/bash

while true
do
	echo "1. Ver estado del Servicio Cups"
	echo "2. Iniciar el Servicio Cups"
	echo "3. Parar el Servicio Cups"
	echo "4. Abri navegador con la configuracion de Cups"
	echo "5. Instalar cups"
	echo "6. Desinstalar cups"
	echo "7. Reiniciar la máquina"
	echo "8. Fin del programa"
	read -p "Dime que deseas hacer " orden
	case $orden in 
		1)
			sudo systemctl status cups.service
		;;
		2)
			sudo systemctl start cups.service
			echo "Servicio Iniciado"
		;;
		3)
			sudo systemctl stop cups.service
			echo "Servicio Parado"
		;;
		4)
			firefox 127.0.0.1:631
		;;
		5)
			comando=`whoami`
			sudo apt-get update
			sudo apt-get upgrade
			sudo apt-get install cups
			sudo usermod -a -G lpadmin $comando
			sudo cupsctl --remote-any
			sudo /etc/init.d/cups restart
			sudo apt-get install cups-pdf
			echo "Servicio Instalado"
		;;
		6)
			sudo apt-get remove cups
			sudo apt-get autoremove
		;;
		7)
			reboot
		;;
		8)
			break
		;;
		*)
			echo "Escriba otro numero"
		;;
	esac
done

