# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Joekey <joekey1@gmail.com>

pkgname=airstrike
pkgver=pre6a
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="2d biplane dogfight game in the tradition of the Intellivision and Amiga games 'Biplanes' and 'BIP'"
url="http://icculus.org/airstrike/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
install=$pkgname.install
source=("http://icculus.org/$pkgname/$pkgname-$pkgver-src.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('11232b4bbc760b261a3ae87441783ba5f327f15d37ec095a659ea0cbbed8d9c0'
            '8dc9ad53be6073f25c92b2b69a55fc0c982e1f87e97eafddebab433aa14dd5fa'
            'd234e9fe07a5ac1720faacb2dab37fa0053d1f7f389494d2c1eb3ee147dabba7'
            'ccfb7c76c8047f733711d78f68f417126569eb7224e1a97273dc87900a47c0c0')

prepare() {
  # add lib m
  sed 's|-lSDL_mixer$|& -lm|' -i $pkgname-$pkgver-src/src/Makefile
  # enable sound in config
  sed 's|sound 0|sound 1|' -i $pkgname-$pkgver-src/airstrikerc
}

build() {
  cd $pkgname-$pkgver-src

  # build with sound support
  make airstrike-sound
}

package() {
  cd $pkgname-$pkgver-src

  # executable + launcher
  install -Dm755 $pkgname "$pkgdir"/opt/$pkgname/$pkgname
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data
  cp -r data airstrikerc "$pkgdir"/opt/$pkgname

  # desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # documentation
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/* ChangeLog README "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
