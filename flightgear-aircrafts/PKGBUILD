#Maintainer: Gadget3000 <gadget3000@msn.com>
# Contributor: Adarsh Amirtham <adarshamirtham@gmx.net>
pkgname=flightgear-aircrafts
pkgver=2
pkgrel=3
pkgdesc="A collection of aircrafts for flightgear"
url="http://www.flightgear.org/Downloads/aircraft-2.0.0/"
license="Unknown"
arch=('x86_64' 'i686')
if [ "$(pacman -Qs flightgear-git)" != "" ]; then
depends=('flightgear-git' 'fgdata-git')
else
depends=('flightgear' 'flightgear-data')
fi
makedepends=('unzip')

build() {
  cd ${srcdir}/
  mkdir -p ${pkgdir}/usr/share/flightgear/data/Aircraft/

echo l = Light Aircraft
echo la = Large Airliners
echo sa = Small Airliners
#echo r = Racing
echo sp = Seaplanes and Flying Boats
echo m = Military
echo w = World War 1 \& 2
#echo j = Military Jets
#echo ms = Military Stealth
echo h = Helicopters
echo g = Ground Vehicles
echo o = Other
echo all = Everything
#echo s = Specifiy
echo Enter codes of groups to install and separate with spaces \(eg: l sa g\)
echo ---------------------------------------
read -ea myarray

#Commented files are already included with flightgear
for i in ${myarray[@]}
do
if [ $i == l ] || [ $i == all ]
then
echo Downloading Light Aircraft!
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/14bis_20080922.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/21_20090313.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/airwaveXtreme150_20050430.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Allegro-2000_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ASK21_20070701.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ASK21-MI_20090202.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/asw20_20050430.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/bleriot-XI_20090323.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/bocian_20080722.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/colditz_20070515.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Deperdussin_20090126.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/DerKleineUhu_0.1.zip
#wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Dragonfly_1.0.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Farman-IV_20090522.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/flash2a_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Fouga-Magister_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Grob-G109_20080828.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Long-EZ_20091022.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ornithopter_20050430.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/sgs233_20070506.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Storch_1.0.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/wrightFlyer1903_20050430.zip
fi
if [ $i == la ] || [ $i == all ]
then
echo Downloading Large Airliners!
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/707_20080509.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/727-230_20100301.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/737-100_20100216.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/737-300_20100302.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/747-200_1.1.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/747_20071215.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/747-400_20100228.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/767-300_20100100.zip
#wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/777-200_20100008.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/787_200802.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/A300_20061009.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A320_20070115.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A320-family_20070115.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/A340-600_20080400.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A380_1.0.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/B737_20050614.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Concorde_2.6.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dc6_20091112.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/fokker100_20091117.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/fokker50_20090529.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/L-1011-500_20090418.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/MD11_20070618.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/tu154_20060501.zip
fi
if [ $i == sa ] || [ $i == all ]
then
echo Downloading Small Airliners!
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Aerostar-700_20090930.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/AN-225_20071114.zip
#wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/b1900d_20100201.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/beech99_20080304.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Caravelle_20091229.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Carreidas_20100227.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Citation_20100201.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Citation-Bravo_20100216.zip
#wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/CitationX_20090910.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/couzinet70_20100123.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dc2_20100302.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dc3_20091117.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/DH-91_20080805.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dhc8_20090218.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/HondaJet_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ju52_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Junkers-G.38ce_20090704.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Lockheed1049_1.3.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/MRJ_20090820.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Noratlas_20081219.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/P180_20080212.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Starship_20090620.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/TU-114_20080103.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/YS-11_0.1.zip
fi
#if [ $i == r ] || [ $i == all ]
#then
#echo Downloading Racing!
#
#fi
if [ $i == sp ] || [ $i == all ]
then
echo Downloading Seaplanes and Flying Boats!
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A24-Viking_20090620.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Albatross_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Bernard-HV220_20090522.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Boeing314_1.3.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dhc2_20090901.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dhc6_20090901.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/DO-X_20090702.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/H4-Hercules_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Macchi-Castoldi-MC72_20090522.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/PBY-Catalina_20090411.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Sikorsky-S38_20090802.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/SM-55_20091229.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Supermarine-S.6B_20090427.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Superwal_20091028.zip
fi
if [ $i == m ] || [ $i == all ]
then
echo Downloading Military!
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/A-10_20100227.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/a4_20080828.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A-6E_20091019.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Alphajet_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ANT-20_20100216.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/B-1B_20100123.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/B-2_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/B-52F_20071130.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/BAC-TSR2_20080103.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Bombardier-415_20090310.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Buccaneer_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/C130_20100302.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/C-2A_20081220.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Convair-XFY-1-Pogo_20090301.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/E3B_20090301.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/eurofighter_20100302.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/F-106-dart_20090110.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/F-117_20100302.zip
#wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/f-14b_1.0.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/f15c_20081106.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/f16_20100123.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/f18_20070317.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/F80C_20070521.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/F-86_20090529.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/F-8E-Crusader_20090405.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/harrier_20100123.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/He162_20080223.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Hughes-XF11_20080808.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Hunter_20090202.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/j22_20050614.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Jaguar_20090529.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/KC135_20090327.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/l39_20100219.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Lightning_20081023.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Lockheed-NF104A_20100216.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Lockheed-SR71_20081023.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/MiG-15_20071106.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Mig-29_20100302.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/mirage2000_20070103.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Northrop-xb35_20100123.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/OV10_20100123.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/payen-pa100_20090405.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/RafaleB_20100205.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/SaabJ35Draken_20080304.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/seahawk_20100204.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/SeaVixen_20080304.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/SR71-BlackBird_20090930.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/SU-37_20080202.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/T37_20081023.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/T38_20081023.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/T-4_20080719.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/victor_20100302.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/vulcanb2_20091103.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/X15_20061204.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/YF-23_20081030.zip
fi
if [ $i == w ] || [ $i == all ]
then
echo Downloading World War 1 \& 2!
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/A-26-Invader_20090912.zip
#wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/A6M2_20090320.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/AR-234_20100213.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Arsenal-VG33_20091229.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Avro-Lancaster_20090907.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/B-17_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/B-24-Liberator_20090907.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/B-25_20091112.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/b26_20100130.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/b29_20081030.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/beaufighter_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/bf109_20100201.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/BV-141_20090418.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/CanberraBI8_20071106.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/DO-335_20090303.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/F4U_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/F6F-Hellcat_20100110.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/fkdr1_20090820.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/fw190_20100227.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Horten-Ho-IX_20091229.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Hurricane_20100227.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/IL-2_20090604.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/j7w_20081219.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Ju-87_20100227.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Ki-84_20081219.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/La-5_20090603.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ME-262_20091130.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ME-262HGIII_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/mosquito_20090808.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/P-38-Lightning_20090115.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/P47_20090316.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/p51d_20100227.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Polikarpov-I16_20090529.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/sopwithCamel_20081229.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/SPAD-VII_20090725.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Spitfire_20100227.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/spitfireIX_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/TBM-Avenger_20081116.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Vickers-Vimy_20080922.zip
fi
#if [ $i == j ] || [ $i == all ]
#then
#echo Downloading Military Jets!
#
#fi
#if [ $i == ms ] || [ $i == all ]
#then
#echo Downloading Military Stealth!
#
#fi
if [ $i == h ] || [ $i == all ]
then
echo Downloading Helicopters!
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/AirCrane_20091207.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Alouette-II_20090620.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Alouette-III_20080304.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/apache_20080617.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/as332_20091229.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/bo105_20100216.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/ch47_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ch53e_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Dauphin_20090620.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ec130_0.1.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ec135_0.6.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Fw61_20091025.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/H-21C-Shawnee_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Hornet_20090406.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/HUP-Retriever_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Ka-50_20090620.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Lynx-WG13_20080304.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/OH-1_0.1.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/R22_20080503.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/S-51-Dragonfly_20081116.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Sikorsky-76C_20090406.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Sikorsky-S58_20090331.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Super-Frelon_20090620.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Tigre_20090702.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/UH-1_20091207.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/UH-60_20090331.zip
fi
if [ $i == g ] || [ $i == all ]
then
echo Downloading Ground Vehicles!
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Deuche_20081220.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/jeep_20100201.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/pushback_20080405.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/snowplow_1.0.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/truck_20071027.zip
fi
if [ $i == o ] || [ $i == all ]
then
echo Downloading Other!
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/an2_20080828.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Arup-S2_20090718.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ATC_20100302.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/bluebird_10.4.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Bugatti_20090419.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/c150_20091117.zip
#wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/c172p_20091229.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/c172r_20060313.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/c182_20080808.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/c182rg_20080707.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/c310_20090129.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/c310u3a_20070206.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/C684_20100124.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ComperSwift_20071106.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/cri-cri_20080304.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/DH-88_20090302.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/DH-89_20090303.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/dhc3_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/DR400_20100216.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/ercoupe_20081117.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/FK9MK2_20090522.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Fokker-S-11_20091216.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Gee-Bee_20090715.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Grob-G115_20090715.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/H1-Racer_20100201.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Hansajet_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/HM-14_20100101.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/j3cub_20091102.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/K5Y1_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Katana_20091010.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Lancair-235_20090307.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Lionceau_20091229.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Lockheed-Vega_20100216.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Malolo1_0.0.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/marchetti_20050614.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/MB326_20090709.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/MPCarrier_0.1.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ogel_20090323.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/pa22_20090702.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/pa24-250_20100123.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/pa28-161_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/paraglider_20060114.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/PC-6_20090930.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/pc7_20090418.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/pittss1c_20100216.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Pond-Racer_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Quickie_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/rallye-MS893_20090404.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Rascal_0.1.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/RV-6A_0.1.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Ryan-PT22_20091229.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Ryan-SoSL_20090622.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/santa_20051026.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/SenecaII_0.5.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/shuttle_20080808.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Skyranger_20090522.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Skyvan_20090416.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/sr20_20051010.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Stampe-SV4_20091229.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/Stearman_20090921.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Stieglitz_20091028.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Stiletto_20091229.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Su-26M_1.0.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Submarine_Scout_1.0.zip
#wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/ufo_20090320.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/V22-Osprey_0.2.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/Velocity-XL_20090603.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/x24b_20060114.zip
wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/YardStik_0.0.zip
wget http://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ZF_Navy_free_balloon_1.0.zip
wget ftp://flightgear.uib.no/pub/flightgear/ftp/Aircraft-2.0.0/ZivkoEdge_0.1.zip
wget ftp://ftp.de.flightgear.org/pub/fgfs/Aircraft-2.0.0/Zlin-50lx_20091229.zip
#wget ftp://mirrors.ibiblio.org/pub/mirrors/flightgear/ftp/Aircraft-2.0.0/ZLT-NT_1.0.zip
fi
done

  unzip '*.zip' -d ${pkgdir}/usr/share/flightgear/data/Aircraft/
  rm -f ${pkgdir}/usr/share/flightgear/data/Aircraft/*.zip
  rm -f ${pkgdir}/usr/share/flightgear/data/Aircraft/*.tgz
}
