# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=remood
pkgver=0.8a
pkgrel=3
pkgdesc="An advanced Doom game engine based on Doom Legacy"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('bash' 'sdl')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}src_08a.tar.gz \
	$pkgname.sh)
md5sums=('33e284a22467e732cbdad4d17e03a648'
         'bb89524825be3ea0ab12e55a336343cf')

build() {
  cd ${pkgname}src_${pkgver//./}

  make CC_MODECFLAGS="${CFLAGS} -DNDEBUG" || return 1

  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname.bin
  mkdir -p "$pkgdir"/usr/share/{applications,pixmaps,$pkgname}
  install -m644 bin/$pkgname.wad "$pkgdir"/usr/share/$pkgname/
  install -m644 $pkgname.xpm "$pkgdir"/usr/share/pixmaps/
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  install -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
