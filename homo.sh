#######################################################################
#                                                                     #
#                                                                     #
#                                                                     #
#                    Copyright (C) 2019                               # 
#             Julian Rayo    -   Julian Salamanca                     #
#                                                                     #
#               jmrayo@correo.udistrital.edu.co                       #
#                jasalamanca@udistrital.edu.co                        # 
#                                                                     # 
#       Grupo de Fisica e informatica (Fisinfor) Universidad          #
#                Distrital Francisco Jose de Caldas                   #
#                                                                     #
#                https://github.com/fisinfirgh/HOMO                   #
#                                                                     #
#This program is free software; you can redistribute it and/or modify #
#it under the terms of the GNU General Public License as published by #
#the free Software Foundation; either version  2 of the License, or   #
#(at your option) any later version.                                  #
#                                                                     #
#This program is distributed in the hope that it will be useful,      #
#but WITHOUT ANY WARRANTY; without even the implied warranty of       #
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the         #
#GNU General Public License for more details:                         # 
#                                                                     #
#         http://www.gnu.org/copyleft/gpl.html                        #
#                                                                     #
#######################################################################

#!/bin/bash
log1=log1.txt
log2=log2.txt
ext1=_2000_2007.csv
ext2=_2008_2015.csv
dirtogo=/home/jrayo/JRayo/data_copy/Estaciones
mkdir $dirtogo/final
for ((i=1;i<=11;i++))
do
    cd $dirtogo/Est_$i
    pwd 
    ls 2000_2007.csv 
    cp 2000_2007.csv $log1 
    echo $log1
    sed -i "1d" $log1 
    sed -i "2d" $log1
    sed -i "s/,,/,-1,/g" $log1 
    sed -i "s/,,/,-1,/g" $log1  
    sed -i "s/,$/,-1/g" $log1 
    sed -i "s/,/ /g" $log1 
    awk  '{
for (i=1;i<	=NF;i++){
if ($i>=0){printf $i "\t"}	
if ($i<0){printf  $i "\t"}
if (i==NF){print ""}
}
}' $log1 >> $log2
    echo $log2 $dirtogo/final/skim_Est_$i$ext1
    mv  $log2 $dirtogo/final/skim_Est_$i$ext1
done
for ((i=1;i<=11;i++))
do
    cd $dirtogo/Est_$i
    pwd 
    ls 2008_2015.csv
    cp 2008_2015.csv $log1
    echo $log1
    sed -i "1d" $log1
    sed -i "2d" $log1
    sed -i "s/,,/,-1,/g" $log1 
    sed -i "s/,,/,-1,/g" $log1 
    sed -i "s/,$/,-1/g" $log1 
    sed -i "s/,/ /g" $log1
    awk  '{
for (i=1;i<=NF;i++){
if ($i>=0){printf $i "\t"}
if ($i<0){printf $i "\t"}
if (i==NF){print ""}
}
}' $log1 >> $log2
    echo $log2 $dirtogo/final/skim_Est_$i$ext2
    mv  $log2 $dirtogo/final/skim_Est_$i$ext2
done


 
