# Contributor: CtHx

pkgname=amarok-minimal-git
pkgver=20100423
pkgrel=1
pkgdesc="AmaroK - a media player for KDE. Without lastfm, mp3tunes, mtp and ipod support. GIT version"
arch=('i686' 'x86_64')
url="http://amarok.kde.org"
license=('GPL')
depends=('kdelibs>=4.3' 'kdebase-runtime>=4.3' 'phonon' 'taglib>=1.6' 'taglib-extras>=1.0' 'qt>=4.5' 'qca' "libmysqlclient>=${mysqlver}")
makedepends=('cmake>=2.6.2' 'qtscriptgenerator>=0.1' 'automoc4' 'git')
conflicts=('amarok2' 'amarok' 'amarok2-svn' 'amarok-svn' 'amarok-git')
source=()
md5sums=()

_gitroot="git://gitorious.org/amarok/amarok.git"
_gitname="amarok"


build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  # strigi -> optional
  sed -i 's/strigi.sourceforge.net\" TRUE/strigi.sourceforge.net\" FALSE/' CMakeLists.txt
  # switch off services
  sed -i '/magnatune/d' src/services/CMakeLists.txt
  sed -i '/ampache/d' src/services/CMakeLists.txt
  sed -i '/mp3tunes/d' src/services/CMakeLists.txt
  sed -i '/jamendo/d' src/services/CMakeLists.txt
  
  mkdir amarok-build
  cd amarok-build

  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release \
  -DWITH_LibLastFm=OFF -DWITH_MP3Tunes=OFF -DWITH_Mtp=OFF -DWITH_IPOD=OFF -DWITH_Strigi=OFF || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  cd .. && rm -rf amarok-build
  # rewrite changes
  git reset --hard

}
