_pkgbasename=enchant
pkgname=lib32-$_pkgbasename
pkgver=1.6.0
pkgrel=1
pkgdesc="Enchant (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://www.abisource.com/projects/enchant/"
depends=('lib32-glib2' "$_pkgbasename>=$pkgver")
makedepends=('gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://www.abisource.com/downloads/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('de11011aff801dc61042828041fb59c7')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libdir=/usr/lib32 --enable-static=no --disable-aspell --disable-ispell --disable-myspell \
      CC='gcc -m32' CXX='g++ -m32'
  make
}
package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,share}
  install -Dm644 COPYING.LIB ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
