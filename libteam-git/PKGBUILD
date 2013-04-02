# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=libteam-git
pkgver=20130402
pkgrel=1
pkgdesc="Library for controlling team network device"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/libteam/"
license=('LGPL2.1')
depends=('jansson' 'libnl' 'libdaemon')
makedepends=('git' )
 
source=('git://github.com/jpirko/libteam.git')
md5sums=('SKIP')
_gitname=libteam

pkgver() {
  date +"%Y%m%d"
}
 
build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
