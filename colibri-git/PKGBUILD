# Contributor : Martin Lee <hellnest.fuah@gmail.com>

pkgname=colibri-git
pkgver=20130123
pkgrel=1
pkgdesc="Colibri provides an alternative to KDE4 Plasma notifications, git
version"
arch=('i686' 'x86_64')
url="http://gitorious.org/colibri"
provides=('notification-daemon')
conflicts=('colibri')
license=('GPL')
depends=('kdebase-workspace>=4.4')
makedepends=('gcc' 'cmake' 'automoc4')
install=colibri.install
_gitroot=git://anongit.kde.org/colibri
_gitname=colibri
 
build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Local copy is up to date"
  else
    git clone $_gitroot
    cd $_gitname
  fi
  msg "GIT Checkout Done"

  rm -rf $_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../ || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
