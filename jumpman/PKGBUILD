# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=jumpman
pkgver=1.0.2
pkgrel=2
pkgdesc="An addictve retro-style game"
arch=('i686')
url="http://runhello.com/"
license=('custom')
depends=('sdl' 'libgl' 'mesa')
source=(http://cat.runhello.com/Jumpman_lin.tar.gz $pkgname.sh)
md5sums=('2e44472f33a70a3dff85a6664cd02b70'
         'd49c74aa2d02b1510fcfd8f490706511')

build() {
  cd "$srcdir"
  install -d -m755 "$pkgdir"/opt
  cp -r Jumpman "$pkgdir"/opt/$pkgname

  install -D -m644 Jumpman/Readme.txt "$pkgdir"/usr/share/licenses/$pkgname/Readme
  install -D -m755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
