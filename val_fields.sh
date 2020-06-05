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
log3=log3.txt
log4=log4.txt
ext1=_2000_2007.csv
ext2=_2008_2015.csv
dirtogo=/home/jrayo/JRayo/data_copy/Estaciones/final

for ((i=10;i<=10;i++)) 
do
    cd $dirtogo
    cp skim_Est_$i$ext1 $log1
    echo $log1
    awk '{
if(NR==1){ 
for(i=0;i<25;i++){R[i]=-1} 
for(i=1;i<=25;i++){
if($i=="Fecha"){R[0]=i}
if($i=="Tiempo"){R[1]=i}
if($i=="SO2"){R[2]=i}
if($i=="O3API"){R[3]=i}
if($i=="CO"){R[4]=i}
if($i=="OZONO"){R[5]=i}
if($i=="PM10"){R[6]=i}
if($i=="PM2.5"){R[7]=i}
if($i=="RadSolar"){R[8]=i}
if($i=="VelViento"){R[9]=i}
if($i=="DirViento"){R[10]=i}
if($i=="Precipitacion"){R[11]=i}
if($i=="NOX"){R[12]=i}
if($i=="NO"){R[13]=i}
if($i=="Temperatura"){R[14]=i}
if($i=="Humedad"){R[15]=i}
if($i=="PresionBaro"){R[16]=i}
if($i=="NO2"){R[17]=i}
if($i=="R_SGlobal"){R[18]=i}
if($i=="UVB"){R[19]=i}
if($i=="Temperatura20M"){R[20]=i}
if($i=="VelViento10M"){R[21]=i}
if($i=="DirViento10M"){R[22]=i}
if($i=="Temperatura2m"){R[23]=i}
if($i=="Temperatura8M"){R[24]=i}
}
}
for(i=2;i<=70137;i++){
if(NR==i){
for(k=0;k<=24;k++){
if (R[k]<0) {R[k]=-(k+1); printf R[k] "\t"}
else if (R[k] != 0){printf $R[k] "\t"}
if(k==24){print ""}
}
}
}
}' $log1 >> $log2	

   
    awk 'NR>=2{
for (j=1;j<=25;j++){
if ($j==-1){$j=-j; printf $j "\t"}
else  if ($j != -1){printf $j "\t"}
if(j==25){print ""}
}
}'  $log2 >> $log3
   
    awk '($1~2000){print > "clean_Est_i_2000.csv" }
 ($1~2001){print > "clean_Est_i_2001.csv" }
 ($1~2002){print > "clean_Est_i_2002.csv" }
 ($1~2003){print > "clean_Est_i_2003.csv" }
 ($1~2004){print > "clean_Est_i_2004.csv" }
 ($1~2005){print > "clean_Est_i_2005.csv" }' $log3 
    echo  $log3  $dirtogo/FF/clean_Est_$i$ext1
    rm $log2
    mv $log3  $dirtogo/FF/clean_Est_$i$ext1    
done 
