# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=dktools
pkgver=3.18.1
pkgrel=1
pkgdesc="a collection of several tools by Dirk Krause. dktools includes graphic converters, text converters, some daemons, Perl modules, some development tools, administration tools and printing tools."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('dktools-license')
groups=()
depends=( 'wxgtk2.8' 'zlib' 'libpng' 'openssl' 'gdbm' 'bzip2' 'libjpeg' 'libtiff' 'netpbm' 'net-snmp')
makedepends=('make' 'binutils' 'gcc')
privides=(bmeps)
replaces=(bmeps dklibs dktools-gui)
source=(http://sourceforge.net/projects/dktools/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('bb1796c2c6d3980952273ac4e42fae50')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|\`wx-config --|\`/usr/bin/wx-config-2.8 --|" configure configure.ac
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -i DESTDIR="$pkgdir" install
}
