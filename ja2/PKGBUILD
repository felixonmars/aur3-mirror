# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <rabyteNOSPAM_at_moonblade.dot.org>

pkgname=ja2
pkgver=0.12.1
pkgrel=1
pkgdesc="A port of Jagged Alliance 2 to SDL"
arch=('i686' 'x86_64')
url="http://tron.homeunix.org/ja2/"
license=('custom')
depends=('gcc-libs' 'sdl')
install=$pkgname.install
source=(http://tron.homeunix.org/$pkgname/$pkgname-$pkgver-source.tar.bz2
        $pkgname.png)
md5sums=('3981a84850957362fddb0b0e90c231b8'
         'e793ae54bbe8874efc9205280281454f')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # fix icon in the .desktop file
  sed -i "s/jagged2\.ico/$pkgname/" $pkgname-stracciatella.desktop

  # make and install
  export LNG=ENGLISH
  make || return 1
  make \
    PREFIX="$pkgdir"/usr \
    MANPREFIX="$pkgdir"/usr/share \
    install || return 1

  # remove .ico file
  rm -f "$pkgdir"/usr/share/pixmaps/jagged2.ico

  # install license
  install -Dm644 "SFI Source Code license agreement.txt" \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  # install icon
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
