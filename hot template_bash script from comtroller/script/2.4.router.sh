#!/bin/bash
# script for OpenStack Orchestration

        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add router stack                                  \n"  
        echo -e "* 2: Delete router stack                               \n"
        echo -e "****************************************************   \n"

        read -p "Please select your choice :" choice


while  [ $choice != 1 ] || [ $choice != 2 ] 
   do

   case $choice in
        "1")
                echo -e "Adding a router                        \n" 
                heat stack-list
                read -p "Please put the name of your stack :" p_stack_name 
                neutron router-list
                read -p "Please put the name of your router :" p_router_name 
                read -p "Please put the name of your network name :" p_network_name 
                read -p "Please put the name of your network CIDR :" p_net_cidr 
                heat stack-create -f template/2.4.template_router.yaml -P router_name=$p_router_name -P network_name=$p_network_name -P network_cidr=$network_cidr $p_stack_name 
                ;;
        "2")
                echo -e "Deleting flavor stack                  \n"
                heat stack-list
                read -p "Please put the name of your router stack :" p_stack_name
                heat stack-delete $p_stack_name
                ;;

        *)
                echo "other choice"
                ;;            
    esac
    
        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add router stack                                  \n"  
        echo -e "* 2: Delete router stack                               \n"
        echo -e "*                                                      \n"
        echo -e "****************************************************   \n"


        read -p "Please select your choice :" choice
done



