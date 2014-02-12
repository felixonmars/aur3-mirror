# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bashful-git
pkgver=20130904
pkgrel=1
pkgdesc="A collection of libraries to simplify writing bash scripts"
arch=('any')
makedepends=('git')
url="https://github.com/jmcantrell/bashful"
license=('unknown')
source=(git+https://github.com/jmcantrell/bashful)
sha256sums=('SKIP')
provides=('bashful')
conflicts=('bashful')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing permissions...'
  chmod +x bin/* setup.sh
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  DESTDIR="$pkgdir" PREFIX="/usr" ./setup.sh install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
