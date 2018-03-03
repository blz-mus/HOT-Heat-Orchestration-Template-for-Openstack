#!/bin/bash
# script for OpenStack Orchestration

        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add a network stack                               \n"  
        echo -e "* 2: Delete a network stack                            \n"
        echo -e "*                                                      \n"
        echo -e "****************************************************   \n"

        read -p "Please select your choice :" choice


while  [ $choice != 1 ] || [ $choice != 2 ] 

   do

   case $choice in
        "1")
                echo -e "Adding a network                               \n" 
                echo -e "stack list :                                   \n" 
                heat stack-list
                read -p "Please put the name of your stack :" p_stack_name 
                read -p "Please put the name of your network name :" p_network_name 
                read -p "Please put your network CIDR like 192.168.1.0/24 :" p_net_cidr 
                heat stack-create -f template/2.2.template_network.yaml -P network_name=$p_network_name -P network_cidr=$p_net_cidr $p_stack_name 
                sleep 6
                heat stack-list
                ;;
        "2")
                echo -e "Deleting network stack                  \n"
                echo -e "stack list :                                   \n" 
                heat stack-list
                read -p "Please put the name of your network stack :" p_stack_name
                heat stack-delete $p_stack_name
                sleep 3
                heat stack-list
                ;;

        *)
                echo "other choice"
                ;;            
    esac
    
        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add a network stack                               \n"  
        echo -e "* 2: Delete a network stack                            \n"
        echo -e "*                                                      \n"
        echo -e "****************************************************   \n"

        read -p "Please select your choice :" choice
done

