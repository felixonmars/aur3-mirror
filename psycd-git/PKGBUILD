# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=psycd-git
pkgver=20121118
pkgrel=1
pkgdesc="Generic messaging daemon"
arch=('i686' 'x86_64')
depends=('gettext' 'gnunet' 'gtk2' 'libextractor' 'libgcrypt' 'libgsf' 'libmicrohttpd' 'libmpeg2' 'libpsyc-git' 'libunistring' 'openssl' 'poppler' 'sqlite')
makedepends=('cmake' 'git' 'wget')
url="http://about.psyc.eu/Psycd"
license=('AGPL3')
source=(git://git.psyc.eu/psycd)
sha256sums=('SKIP')
provides=('psycd')
conflicts=('psycd')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
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
