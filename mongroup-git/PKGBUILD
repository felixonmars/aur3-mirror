# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mongroup-git
pkgver=20140121
pkgrel=1
pkgdesc="Monitor a group of processes with mon"
arch=('i686' 'x86_64')
depends=('mon-git')
makedepends=('git' 'make')
url="https://github.com/jgallen23/mongroup"
license=('MIT')
source=(git+https://github.com/jgallen23/mongroup)
sha256sums=('SKIP')
provides=('mongroup')
conflicts=('mongroup')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
