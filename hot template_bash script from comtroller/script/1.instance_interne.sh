#!/bin/bash
# script for OpenStack Orchestration

echo -e "***     script for OpenStack Orchestration     *****   \n"  
echo -e "* 1: Add instance                                      \n"  
echo -e "* 2: Delete instance                                   \n"
echo -e "****************************************************   \n"

read -p "Please select your choice :" choice

while  [ $choice != 1 ] || [ $choice != 2 ] 
   do
        case $choice in
        "1")
                echo -e "Adding an instance              \n" 
                echo -e "stack list :            \n" 

                heat stack-list
                read -p "Please put the name of your stack :" p_1_inst
                openstack image list
                read -p "Please select your image :" p_2_inst
                openstack flavor list
                read -p "Please select your flavor :" p_3_inst
                nova keypair-list
                read -p "Please select your key :" p_4_inst
                heat stack-create -f template/1.template_instance_interne.yaml -P image=$p_2_inst -P flavor=$p_3_inst -P key=$p_4_inst $p_1_inst
                sleep 5
                heat stack-list
                ;;
        "2")
                echo "Deleting instance"
                echo -e "stack list :            \n" 
                heat stack-list
                read -p "Please put the name of your stack :" p_6_inst
                heat stack-delete $p_6_inst
                sleep 3
                heat stack-list
                ;;
        *)
                echo "other choice"
                ;;
        esac

        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add instance                                      \n"  
        echo -e "* 2: Delete instance                                   \n"
        echo -e "****************************************************   \n"
        read -p "Please select your choice :" choice
done

