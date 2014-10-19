# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: David 'x89' Trail <napalm10 at gmail>
# Contributor: Soós Gergely <soger at users dot sourceforge dot net>
# Soós wrote the program, I'm just pkgbuilding it :)

pkgname=mplayer-tools
pkgver=7.8
pkgrel=1
pkgdate=20110210
pkgdesc="set of tools to ease the use of mplayer, including saved position and graphical frontend"
arch=('any')
url="http://mplayer-tools.sourceforge.net/"
license=('GPL2')
depends=('perl' 'mplayer')
optdepends=("kdebindings-perlqt: If using the mplayer gui")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.$pkgdate/$pkgname-$pkgver.$pkgdate.tar.gz"
        "01_destdir.patch")
md5sums=('597aa930188adb8d7945d25dde943ddd'
         'f880b49441cf13849da99b61c90a8b65')


build() {
  cd "$srcdir/${pkgname}-${pkgver}.${pkgdate}"

  ./configure --prefix /usr/bin --libdir /usr/lib
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}.${pkgdate}"

  # Cannot patch this in prepare, as configure writes the Makefile again...
  patch -Np1 -i $srcdir/01_destdir.patch
  mkdir -p $pkgdir/usr/share/{icons,pixmaps,applications}
  mkdir -p $pkgdir/etc/profile.d
  mkdir -p $pkgdir/usr/bin
  make DESTDIR=$pkgdir install

}

# vim:set ts=2 sw=2 et:
