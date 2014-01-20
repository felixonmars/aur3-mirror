# Maintainer: speps <speps dot aur dot archlinux dot org>

_commit=87e079bd6e771c42067d50c54e64240a487ceb92
pkgname=cythar
pkgver=0.1.4.10
pkgrel=1
pkgdesc="Polyphonic MIDI sequencer"
arch=('i686' 'x86_64')
url="http://cythar.monoplugs.com/"
license=('GPL3')
depends=('jack' 'qt4')
install="$pkgname.install"
source=("https://github.com/monotomy/CYTHAR-Sequenzer/archive/$_commit.tar.gz"
        "$pkgname.desktop")
md5sums=('3db20cb07a395907834ae60be3e81e27'
         'a09954699a5d5f0fe2f92d6ab6a3dd08')

build() {
  cd CYTHAR-Sequenzer-$_commit
  make
}

package() {
  cd CYTHAR-Sequenzer-$_commit

  # bin
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # icon
  install -Dm644 images/site_logo.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
