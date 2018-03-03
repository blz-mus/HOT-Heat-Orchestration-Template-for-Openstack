#!/bin/bash
# script for OpenStack Orchestration

        echo -e "***     script for OpenStack Orchestration     *****   \n"  
        echo -e "* 1: Add security group stack                          \n"  
        echo -e "* 2: Delete security group stack                       \n"
        echo -e "****************************************************   \n"

        read -p "Please select your choice :" choice


while  [ $choice != 1 ] || [ $choice != 2 ] 

   do

   case $choice in
        "1")
                echo -e "Adding a security group                        \n" 
                heat stack-list
                read -p "Please put the name of your stack :" p_stack_name 
                read -p "Please put the name of your security group name :" p_sg_name
                read -p "Please put the name of your protocol like TCP or ICMP ... etc  :" p_protocol_name 
                read -p "Please put port_range_min :" p_port_range_min 
                read -p "Please put port_range_max :" p_port_range_max
                heat stack-create -f template/2.5.template_securitygroup.yaml -P security_group_name=$p_sg_name -P protocol=$p_protocol_name -P port_range_min=$p_port_range_min -P port_range_max=$p_port_range_max $p_stack_name
                ;;
        "2")
                echo -e "Deleting security groupe stack                  \n"
                heat stack-list
                read -p "Please put the name of your security groupe stack :" p_stack_name
                heat stack-delete $p_stack_name
		sleep 5
		heat stack-list
                ;;

        *)
                echo "other choice"
                ;;            
    esac
    
        echo -e "***     script for OpenStack Orchestration     *****    \n"  
        echo -e "* 1: Add security group stack                           \n"  
        echo -e "* 2: Delete security group stack                        \n"
        echo -e "*      						 \n" 
        echo -e "*****************************************************   \n"


        read -p "Please select your choice :" choice
done


