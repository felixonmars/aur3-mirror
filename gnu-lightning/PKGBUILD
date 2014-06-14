pkgname=gnu-lightning
pkgver=2.0.4
pkgrel=1
pkgdesc="A library that generates assembly language code at run-time"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/lightning/"
license=('GPL')
groups=('base-devel')
conflicts=('gnu-lightning-git')
depends=('zlib')
source=(http://ftp.gnu.org/gnu/lightning/lightning-2.0.4.tar.gz)
md5sums=(7b3531ee3e9eda484ebca109f362645c)

build() {
  cd ${srcdir}/lightning-${pkgver}
  LDFLAGS="-lz" ./configure --prefix=/usr $(if [ $CARCH = 'x86_64' ]; then echo "--disable-disassembler"; fi)
  make
}

package() {
  cd ${srcdir}/lightning-${pkgver}
  make DESTDIR=${pkgdir} install
}
