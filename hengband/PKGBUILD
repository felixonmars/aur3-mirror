# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=hengband
pkgver=1.6.2
pkgrel=2
pkgdesc="hengband variant of angband"
arch=('i686' 'x86_64')
url="http://hengband.sourceforge.jp"
license=('unknown')
depends=('ncurses')
source=(http://dl.sourceforge.jp/$pkgname/10331/$pkgname-$pkgver.tar.gz)
sha256sums=('2c8ebfb8130bab007568f11c8d6e8b7face2304db664729a2488bb84bd7601c3')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure \
    --with-libpath=/usr/lib/hengband/ \
    --disable-xim \
    --disable-japanese \
    --enable-chuukei \
    --with-x
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  install -d "${pkgdir}/usr/lib"

  install -D -m755 "src/$pkgname" "${pkgdir}/usr/bin/$pkgname"
  cp -R ./lib/ "${pkgdir}/usr/lib/$pkgname"
  chmod -R 775 "${pkgdir}/usr/lib/$pkgname"
  chown -R root:users "${pkgdir}/usr/lib/$pkgname"

#removing unneeded files
  find "${pkgdir}" -iname delete.me -delete
  find "${pkgdir}" -iname Makefile -delete
  find "${pkgdir}" -iname Makefile.am -delete
  find "${pkgdir}" -iname Makefile.in -delete
}
