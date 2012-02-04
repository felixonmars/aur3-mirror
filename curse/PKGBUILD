# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=curse
pkgver=0.9.6
pkgrel=4
pkgdesc='A remake of the C64 strategy game "Curse of the Keys"'
arch=('any')
url="http://www.pygame.org/project/922/"
license=('GPL3' 'Public Domain' 'custom')
depends=('python-pygame')
[ "$CARCH" = "i686" ] && optdepends=('psyco')
install=$pkgname.install
source=(http://evil-monkey-in-my-closet.com/$pkgname/CurseOfTheKeys-$pkgver.tar.gz \
	$pkgname-$pkgver.patch \
	$pkgname.sh \
	$pkgname.desktop \
	LICENSE)
md5sums=('05afdb4389613ac6a93a09e29f5d4a87'
         '12140a2a34bb0774fd58a6e88016d2b5'
         'de620fbb66054c30ff692bdf295f23f5'
         'c8d486f98f4652ff10dd99885b80c517'
         'f688f5f8a7fd823c724d92940467ccb1')

build() {
  cd CurseOfTheKeys

  # patch to save to homedir, start fullscreen and redefine keys (see README)
  patch -Np0 -i ../$pkgname-$pkgver.patch || return 1

  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -rf start.py backs/ font/ sounds/ src/ tiles/ "$pkgdir"/usr/share/$pkgname/
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README

  install -Dm644 tiles/Priest.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
