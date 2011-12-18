#Maintained by ivoarch <ivayloarch@gmail.com> 
pkgname=cclock
pkgver=0.96
pkgrel=1
pkgdesc="A console clock written in C."
arch=('i686' 'x86_64')
url=('http://www.hackl.dhs.org/cclock/')
license=('GPL')
depends=('ncurses') 
makedepends=( )
source=(http://sourceforge.net/projects/cclock/files/${pkgname}-${pkgver}.tar.bz2) 
md5sums=('ba9257f84c261ffff83e972e3cf28939')

build() {
 
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
