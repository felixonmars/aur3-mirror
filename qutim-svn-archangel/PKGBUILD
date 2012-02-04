# qutIM smart builder system.

# Contributor: atommix aka Aleks Lifey <Aleks.Lifey@gmail.com> (mail and jid)
# I'm from Russia! :-D

# Code for ImagePub and Yandex.Narod plugins writing by Alexander Kazarin <boiler@co.ru>
# Regards 

#qutim_include = install src/qutim/include/qutim to /usr/include/
builds=(qutim icq jabber !mrim qutim_include \
        protocolicon imagepub yandexnarod weather)

#Read more herе http://www.qutim.org/forum/viewtopic.php?f=30&t=698&p=8720#p8720
#only one parametr for crypt please
#plugin_jabber_param=([-DGNUTLS=1 || -DOpenSSL=1 || -DWinTLS=1] [-DZLib=1] [-DPhonon=1])
#recommended
plugin_jabber_param=(-DGNUTLS=1 -DZLib=1)

#if 1 then true, if 0 then false
fully_stopping_building_if_error=0

#rm -rf $startdir/src/$_svnmod-build
remove_src_build=1

pkgname=qutim-svn-archangel
pkgver=90
pkgrel=5
pkgdesc="Multiplatform instant messenger, with plugin system. Currently support ICQ, Jabber, MRIM and other additional plugins"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('subversion' 'cmake' 'qt' 'wget' 'tar' 'bzip2' 'gzip')
depends=('qt')
conflicts=('qutim' 'qutim-svn')                                                                          
provides=('qutim' 'qutim-svn')
source=()
md5sums=()

_svntrunk=http://qutim.org/svn/qutim
_svnmod=qutim

build()
{
 exceptions=()

 remove_src_build_func()
 {
  if [[ "$remove_src_build" = "1" ]]; then
   rm -rf $startdir/src/$_svnmod-build
  fi
 }

 exceptions_func()
 {
  #everythig first. else trouble.
  s=$?

  if [[ "$fully_stopping_building_if_error" = "1" ]]; then
   echo "exceptions_func(): $1 $2 $s #######################################"
   echo "exceptions_func(): fully_stopping_building_if_error = 1 #######################################"
   exit
  fi
  echo "exceptions_func(): $1 $2 $s #######################################" 
  exceptions[${#exceptions[@]}]="$1"
  exceptions[${#exceptions[@]}]="$2"
  exceptions[${#exceptions[@]}]="$s"
 }
 
 exceptions_result_func()
 {
  if [[ "${#exceptions[@]}" > "0" ]]; then
   echo "exceptions_result_func():"
   echo "WARNING! EXCEPTIONS ########################################"
   echo "{"
    for ((i=0; i<${#exceptions[@]}; i+=3))
    do
     #name (qutim, icq, jabber, mrim)
     s=${exceptions[i]}
     #build program
     s1=${exceptions[i+1]}
     #error number
     s2=${exceptions[i+2]}
     echo " $s <$s1> return error $s2"
    done
   echo "}"
   echo "WARNING! EXCEPTIONS ########################################"
  fi 
 }

 update_func()
 {
  for i in "${builds[@]}"
  do
   if [[ ${i:0:1} != "!" ]]; then
    echo "update_func(): $i +++++++++++++++++++++++++++++++++++++++++"
   fi
   case $i in
    qutim) 
     svn co http://qutim.org/svn/$i || exceptions_func $i "svn"
    ;;
    icq | jabber)
     cd $startdir/src/$_svnmod/plugins || exceptions_func $i "cd"
     svn co http://qutim.org/svn/$i || exceptions_func $i "svn"
    ;;
    mrim)
     cd $startdir/src/$_svnmod/plugins || exceptions_func $i "cd"
     svn co http://qutim.org/svn/$i/trunk mrim || exceptions_func $i "svn"
    ;;
    protocolicon)
     cd $startdir/src/$_svnmod/plugins || exceptions_func $i "cd"
     wget -O $i.tar.bz2 http://qutim.org/downloads/$i.tar.bz2  || exceptions_func $i "wget"
     tar jxvf $i.tar.bz2 || exceptions_func $i "tar"
    ;;
    imagepub | yandexnarod)                                        
     cd $startdir/src/$_svnmod/plugins || exceptions_func $i "cd"      
     wget -O $i.tar.gz http://boiler.co.ru/qutim/$i.tar.gz || exceptions_func $i "wget"
     tar zxvf $i.tar.gz || exceptions_func $i "tar"
    ;;
    weather)
     cd $startdir/src/$_svnmod/plugins || exceptions_func $i "cd"
     wget -O $i.tar http://deltaz.ru/sites/default/files/archive.tar || exceptions_func $i "wget"
     tar xvf $i.tar || exceptions_func $i "tar"
    ;;
   esac
  done
 }

 build_func()
 {
  for i in "${builds[@]}"
  do
   if [[ ${i:0:1} != "!" ]]; then
    echo "build_func(): $i +++++++++++++++++++++++++++++++++++++++++"
   fi
   case $i in
    qutim)
     cmake . || exceptions_func $i "cmake" 
     make || exceptions_func $i "make"
    ;;
    icq | mrim | imagepub | yandexnarod | protocolicon | weather)
     cd $startdir/src/$_svnmod-build/plugins/$i
     qmake || exceptions_func $i "qmake"
     make || exceptions_func $i "make"
    ;;
    jabber)
     cd $startdir/src/$_svnmod-build/plugins/$i
     echo "cmake ${plugin_jabber_param[@]} ."   
     cmake ${plugin_jabber_param[@]} . || exceptions_func $i "cmake"
     make || exceptions_func $i "make"
    ;;
   esac
  done 
 }
 
 install_func()
 {
  for i in "${builds[@]}"
  do
   if [[ ${i:0:1} != "!" ]]; then
    echo "install_func(): $i +++++++++++++++++++++++++++++++++++++++++"
   fi
   case $i in
    qutim) 
     install -D \
      $startdir/src/$_svnmod-build/$i \
      $pkgdir/usr/bin/$i || exceptions_func $i "install"
    ;;
    icq) 
     install -D \
      $startdir/src/$_svnmod-build/plugins/lib$i.so \
      $pkgdir/usr/lib/$_svnmod/lib$i.so || exceptions_func $i "install"
    ;;
    jabber | mrim) 
     install -D \
      $startdir/src/$_svnmod-build/plugins/$i/lib$i.so \
      $pkgdir/usr/lib/$_svnmod/lib$i.so || exceptions_func $i "install"
    ;;
    qutim_include) 
     install -Dd \
      $startdir/src/$_svnmod-build/include/qutim \
      $pkgdir/usr/include/$_svnmod || exceptions_func $i "install_dir"
     install -D \
      $startdir/src/$_svnmod-build/include/qutim/*.h \
      $pkgdir/usr/include/$_svnmod/ || exceptions_func $i "install_files"
    ;;
    imagepub | yandexnarod | protocolicon | weather) 
     install -D \
      $startdir/src/$_svnmod-build/plugins/lib$i.so \
      $pkgdir/usr/lib/$_svnmod/lib$i.so || exceptions_func $i "install"
    ;;
   esac
  done
 }
 
 cd $startdir/src
 msg "Getting sources from SVN..."
 
 update_func
 
 remove_src_build_func
 
 cp -rf $startdir/src/$_svnmod $startdir/src/$_svnmod-build
 cd $startdir/src/$_svnmod-build
 msg "SVN checkout done or server timeout"
 msg "Starting make..."
 
 build_func
 install_func

 exceptions_result_func

 mkdir -p $pkgdir/usr/share/pixmaps
 cp $startdir/src/$_svnmod-build/icons/qutim_64.png $pkgdir/usr/share/pixmaps/qutim.png

 mkdir -p $pkgdir/usr/share/applications

 echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=qutIM
Exec=qutim
Terminal=false
Icon=/usr/share/pixmaps/qutim.png
Categories=Application;Network;" > $pkgdir/usr/share/applications/qutim.desktop

 remove_src_build_func
}


