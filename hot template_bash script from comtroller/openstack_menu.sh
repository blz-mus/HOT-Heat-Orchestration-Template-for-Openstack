#!/bin/bash
# script for OpenStack Orchestration

#cd 
#. openrc
#cd hot_script/
source /root/openrc


        echo -e "***     script for OpenStack Orchestration     *********\n"  
        echo -e "* 1: Add/Delete instance                               *\n"
        echo -e "* 2: Add/Delete flavor                                 *\n"  
        echo -e "* 3: Add/delete Router                                 *\n"
        echo -e "* 4: Add/Deletete Security Group                       *\n"
        echo -e "* 5: Add/Delete Network                                *\n"
        echo -e "* 6:                                                   *\n"
        echo -e "* 7:                                                   *\n"
        echo -e "********************************************************\n"

        read -p "Please select your choice :" choice  

 while  [ $choice != 1 ] || [ $choice != 2 ] || [ $choice != 3 ] || [ $choice != 4 ] || [ $choice != 5 ]
   do
        case $choice in
                "1")
                        echo -e "* 1: Add/Delete instance                               \n" 
                        ./script/1.instance_interne.sh
                        ;;
                "2")
                        echo -e "Add/Delete flavor                                      \n" 
                        ./script/2.1.flavor.sh
                        ;;
                "3")
                        echo -e "3: Add/delete Router                                   \n"
                        ./script/2.4.router.sh
                        ;;
                "4")
                        echo -e "4: Add/Deletete Security Group                         \n "
                        ./script/2.5.securitygroup.sh
                        ;;
                "5")
                        echo -e "5: Add/Deletete Network                                \n "
                        ./script/2.2.network.sh
                        ;;
                *)
                        echo "other choice"
                        ;;
        esac


        echo -e "***     script for OpenStack Orchestration     *********\n"  
        echo -e "* 1: Add/Delete instance                               *\n"
        echo -e "* 2: Add/Delete flavor                                 *\n"  
        echo -e "* 3: Add/delete Router                                 *\n"
        echo -e "* 4: Add/Deletete Security Group                       *\n "
        echo -e "* 5: Add/Delete Network                                *\n"
        echo -e "* 6:                                                   *\n"
        echo -e "* 7:                                                   *\n"
        echo -e "********************************************************\n"
        read -p "Please select your choice :" choice  
done

