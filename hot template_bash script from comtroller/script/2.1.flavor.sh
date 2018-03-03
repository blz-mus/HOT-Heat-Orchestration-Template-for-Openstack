#!/bin/bash
# script for OpenStack Orchestration

echo -e "***     script for OpenStack Orchestration     *****   \n"  
echo -e "* 1: Add flavor 		                        \n"  
echo -e "* 2: Delete flavor   	                                \n"
echo -e "* 3: Show flavor detail                                \n"
echo -e "****************************************************   \n"

read -p "Please select your choice :" choice

while  [ $choice != 1 ] || [ $choice != 2 ] || [$choice != 3 ]  

	do
	case $choice in
        "1")
                echo -e "Adding a flavor 			\n" 
                openstack flavor list
                read -p "Please put the name of your stack :" p_stack_name 
                heat stack-create -f template/2.1.template_flavor.yaml  $p_stack_name

                ;;
        "2")
                echo -e "Deleting flavor stack			\n"
                heat stack-list
                read -p "Please put the name of your flavor stack :" p_stack_name
                heat stack-delete $p_stack_name
                ;;
                
        "3")
                echo -e "Show detail of stack 			\n"
                openstack flavor list
                read -p "Please put the name of your flavor :" p_flavor_name
                openstack flavor show  $p_flavor_name
                ;;


        *)
                echo "other choice"
                ;;
	esac
	
	echo -e "***     script for OpenStack Orchestration     *****   \n"  
	echo -e "* 1: Add flavor 		                        \n"  
	echo -e "* 2: Delete flavor   	                                \n"
	echo -e "* 3: Show flavor detail                                \n"
	echo -e "****************************************************   \n"

	read -p "Please select your choice :" choice
done
