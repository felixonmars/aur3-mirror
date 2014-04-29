# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=cope-avr
pkgver=1.0
pkgrel=1
pkgdesc="AVR-GCC scripts for Cope"
arch=('any')
url="http://stuff.cytzol.org/cope/"
license=('GPL')
depends=('cope')

package() {
  install -d "$pkgdir/$(cope_path)"
  cd "$pkgdir/$(cope_path)"

  ln -s "$(cope_path)/gcc" avr-gcc
  ln -s "$(cope_path)/gcc" avr-g++
  ln -s "$(cope_path)/gcc" avr-c++
}
