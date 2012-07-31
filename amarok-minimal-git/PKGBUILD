# Contributor: CtHx

pkgname=amarok-minimal-git
pkgver=20120801
pkgrel=1
pkgdesc="AmaroK - a media player for KDE. Without lastfm, mp3tunes, mtp and ipod support. GIT version"
arch=('i686' 'x86_64')
url="http://amarok.kde.org"
license=('GPL')
depends=('kdebase-runtime'  'taglib>=1.7' 'taglib-extras>=1.0' "libmysqlclient>=${mysqlver}")
makedepends=('cmake>=2.6.2' 'qtscriptgenerator>=0.1' 'automoc4' 'git')
conflicts=('amarok2' 'amarok' 'amarok2-svn' 'amarok-svn' 'amarok-git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/amarok.git"
_gitname="amarok"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull origin
    git reset --hard 	#rewrite changes
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # switch off services
  sed -i '/amazon/d' src/services/CMakeLists.txt
  sed -i '/magnatune/d' src/services/CMakeLists.txt
  sed -i '/ampache/d' src/services/CMakeLists.txt
  sed -i '/mp3tunes/d' src/services/CMakeLists.txt
  sed -i '/jamendo/d' src/services/CMakeLists.txt
  sed -i '/opmldirectory/d' src/services/CMakeLists.txt
  
  # scripts
  sed -i '/free_music_charts_service/d' src/scripts/CMakeLists.txt
  #sed -i '/librivox_service/d' src/scripts/CMakeLists.txt
  
  
  if [[ -d amarok-build ]]
  then
    rm -rf amarok-build
  fi
   mkdir amarok-build
  cd amarok-build

  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
	   -DCMAKE_BUILD_TYPE=Release \
	   -DWITH_LibLastFm=OFF \
	   -DWITH_MP3Tunes=OFF \
	   -DWITH_Mtp=OFF \
	   -DWITH_IPOD=OFF \
	   -DWITH_LibOFA=OFF \
	   -DWITH_QJSON=OFF \
	   -DWITH_Mygpo-qt=OFF \
	   -DWITH_SPECTRUM_ANALYZER=OFF \
	   || return 1

  make || return 1

}
package() {
  cd ${srcdir}/${_gitname}/amarok-build
  make DESTDIR=${pkgdir} install || return 1
  cd .. && rm -rf amarok-build
  # rewrite changes
  git reset --hard

}
