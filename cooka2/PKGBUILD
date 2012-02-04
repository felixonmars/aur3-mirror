# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cooka2
pkgver=0.4
pkgrel=3
pkgdesc="A small and simple image viewer written in C-Sharp"
arch=('i686' 'x86_64')
url="http://www.laas02.org/?page_id=19"
license=('LGPL')
depends=('gtk-sharp-2')
source=(http://www.laas02.org/wp-content/res/cka/Cooka2_${pkgver}_src.tar.gz \
	Makefile \
	$pkgname.desktop)
md5sums=('9820a107c5f15eea9aee8a5d3c14991b'
         '7ed595c160d35a175ead69fc319a75cf'
         'dc5ceb5f2bd06198d7dbba5118630d13')

build() {
  mkdir .wapi
  export MONO_SHARED_DIR="$srcdir"/.wapi

  cd Cooka2_src

  ln -sf ../Makefile

  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 logo_v1_ico.png \
	"$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop \
	"$pkgdir"/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
