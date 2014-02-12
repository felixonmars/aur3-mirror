# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libpsyc-git
pkgver=20130920
pkgrel=1
pkgdesc="PSYC library in C"
arch=('i686' 'x86_64')
makedepends=('git' 'make')
url="http://about.psyc.eu/Libpsyc"
license=('AGPL3')
source=(git://git.psyc.eu/libpsyc)
sha256sums=('SKIP')
provides=('libpsyc')
conflicts=('libpsyc')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  make install prefix="$pkgdir/usr"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
