# Maintainer: Quentin Stievenart <acieroid@awesom.eu>
pkgname=tamca
pkgver=0.1
pkgrel=1
pkgdesc="A timer for the Pomodoro Technique"
url="https://github.com/acieroid/tamca"
arch=('x86_64' 'i686')
license=('BSD')
depends=('gtk2' 'freealut')
optdepends=('beep: PC speaker beep support'
            'mplayer: sound support')
source=("https://github.com/acieroid/tamca/tarball/0.1")
md5sums=('adcb7d8cd9e8953f93d81471e85f6a31')

build() {
  cd acieroid-tamca-51a1279/
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd acieroid-tamca-51a1279/
  make DESTDIR="${pkgdir}" install
}
