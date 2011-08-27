# Maintainer: Remy Marquis <remy.marquis@gmail.com>
pkgname=rcconf-settings-git
pkgver=20110816
pkgrel=1
pkgdesc="RcConf Settings is a KCM for managing the main system config file rc.conf"
arch=('i686' 'x86_64')
url="http://gitorious.org/chakra/rcconf-settings"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
conflicts=('kcm-rcconf-settings')

_gitroot="git://gitorious.org/chakra/rcconf-settings.git"
_gitname="rcconf-settings"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    rm -rf ${srcdir}/${_gitname}-build
  fi
  mkdir $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR="$pkgdir" install
}
