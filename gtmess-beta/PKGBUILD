# Contributor: Higor Eurípedes <heuripedes at gmail dot com>
pkgname=gtmess-beta
pkgver=0.96
pkgrel=2
pkgdesc="A console MSN Messenger client for Linux and other unix systems that conform to the POSIX standard. BETA version"
arch=('i686')
url="http://gtmess.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'openssl' 'pth' 'zlib' 'tcl')
provides=('gtmess')
conflicts=('gtmess')
source=('http://ufpr.dl.sourceforge.net/project/gtmess/gtmess/0.96/gtmess-0.96beta2.tar.gz')
md5sums=('7d10fb460433235e985ce0af67e622fd')

build() {
  cd $startdir/src/gtmess-${pkgver}beta${pkgrel}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
