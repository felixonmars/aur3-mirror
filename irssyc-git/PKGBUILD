# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=irssyc-git
pkgver=20120313
pkgrel=1
pkgdesc="Native PSYC client designed to work with psycd"
arch=('i686' 'x86_64')
depends=('glib2' 'irssi' 'libpsyc-git' 'psycd-git')
makedepends=('cmake' 'git' 'wget')
url="http://about.psyc.eu/Irssyc"
license=('AGPL3')
source=(git://git.psyc.eu/irssyc)
sha256sums=('SKIP')
provides=('irssyc')
conflicts=('irssyc')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  cmake .
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
