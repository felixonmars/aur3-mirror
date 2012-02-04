# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=transfusion
pkgver=1.05_beta2
pkgrel=1
pkgdesc="A remake of the FPS game "Blood" by Monolith using the modern Darkplaces engine"
arch=('any')
url="http://www.transfusion-game.com/"
license=('GPL' 'custom')
depends=('bash' 'darkplaces')
source=(http://offload.funwithheads.com/$pkgname/files/beta/$pkgname-1.05-beta2.zip \
	$pkgname-dedicated.sh \
	$pkgname-glx.sh \
	$pkgname-sdl.sh)
md5sums=('c19cc9a8160d47b1ea23305a38f1d091'
         '24d6ab7fab8a076a12e1fceacd877013'
         'd21bc972234e71b414299810b7ca44d6'
         '1afba97dc292b33295e2c594d1f06b74')

build() {
  cd $pkgname-${pkgver//_/-}

  chmod 644 basetf/*

  mkdir -p "$pkgdir"/usr/share/{quake,doc}
  cp -rf basetf/ "$pkgdir"/usr/share/quake/
  cp -rf doc/ "$pkgdir"/usr/share/doc/$pkgname/

  install -Dm644 doc/license.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  for i in {dedicated,glx,sdl}; do
	install -Dm755 ../$pkgname-$i.sh "$pkgdir"/usr/bin/$pkgname-$i
  done
}

# vim:set ts=2 sw=2 et:
