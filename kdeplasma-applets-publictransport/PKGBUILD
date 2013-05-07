# Maintainer: Guido <qqqqqqqqq9 at web dot de>
# Contributer: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-publictransport
_gitname=publictransport
pkgver=0.11beta
pkgrel=1
pkgdesc="Plasmoid with departure board for a given stop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/PublicTransport?content=106175"
license=('GPL')
conflicts=('publictransport-plasmoid')
depends=('kwebkitpart' 'kdebase-workspace' 'protobuf' 'kdeedu-marble')
makedepends=('git' 'cmake' 'svn' 'automoc4' )
source=('git://anongit.kde.org/publictransport' 'CMakeLists.txt' )
md5sums=( 'SKIP' 'ea69269594270f00ba8f137c92d0cc49' )
install="${pkgname}.install"
_language="de"
# available languages: 
#_language="pt_BR ca et fr de ga ja lt pt sk es sv uk"
options=()
build() {
###### Not sure what to do with this: 
####################################################
###### ### Run kbuildsycoca4 ##############################
###### ####################################################
###### if [ ! $word == "Localization" ] && [ $uninstall -ne 2 ]; then
######  # Run kbuildsycoca4 only if not only a cleanup was performed
######  dialog --backtitle "$title" --title " kbuildsycoca4 " \
######         --gauge "\Zb\nRefreshing KDE System Configuration Cache" 7 70 100 &
######  kbuildsycoca4 2> /dev/null &
######  kbuildsycoca4_pid=$!
######  wait $kbuildsycoca4_pid # Wait for kbuildsycoca4 to finish
######  fi

/bin/rm -rf $srcdir/$_gitname/build
mkdir $srcdir/$_gitname/build
cd $srcdir/$_gitname/build

  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DINSTALL_PROVIDER_TYPE_SCRIPT=ON \
    -DINSTALL_PROVIDER_TYPE_GTFS=ON \
    -DINSTALL_GTFS_REALTIME=ON\
    -DINSTALL_APPLET=ON \
    -DINSTALL_APPLET_FLIGHTS=ON \
    -DINSTALL_APPLET_GRAPHICALTIMETABLELINE=ON \
    -DINSTALL_RUNNER=ON \
    -DINSTALL_ICONS=ON \
    -DINSTALL_ENGINE_OPENSTREETMAP=ON \
    -DINSTALL_TIMETABLEMATE=ON \
    -DCMAKE_BUILD_TYPE=Release 

  make 
  
  #
  # Localisation
  #
  
  mkdir -p $srcdir/$_gitname/l10n
  cd $srcdir/$_gitname/l10n
  mv $srcdir/CMakeLists.txt .
  for language in ${_language}; do  
    langCode=${language//\"/};
    mkdir -p $srcdir/$_gitname/l10n/$language
    cd $srcdir/$_gitname/l10n/$language
    for name in libpublictransporthelper plasma_applet_publictransport plasma_applet_graphicaltimetableline plasma_applet_flights \
      plasma_engine_publictransport plasma_runner_publictransport timetablemate;  
    do
      svn --force export -r HEAD svn://anonsvn.kde.org/home/kde/trunk/l10n-kde4/${langCode}/messages/playground-base/${name}.po
      if [ -d build ]; then
         /bin/rm -rf build
      fi
    done
  done
  mkdir -p $srcdir/$_gitname/l10n/build
  cd $srcdir/$_gitname/l10n/build
  cmake ..  -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` 
  make

}
package() {
  cd $srcdir/$_gitname/l10n/build
  make DESTDIR="$pkgdir/" install
  cd $srcdir/$_gitname/build
  make DESTDIR="$pkgdir/" install
}
