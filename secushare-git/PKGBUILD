# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=secushare-git
pkgver=20130719
pkgrel=1
pkgdesc="P2P encrypted social network framework which combines PSYC's social and messaging logic with GNUnet"
arch=('i686' 'x86_64')
depends=('gnunet' 'libextractor' 'libmicrohttpd' 'libpsyc-git' 'psycd-git' 'qt4')
makedepends=('cmake' 'git' 'wget')
url="http://secushare.org/"
license=('AGPL3')
source=(git://git.psyc.eu/secushare)
sha256sums=('SKIP')
provides=('secushare')
conflicts=('secushare')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  qmake-qt4 PREFIX="$pkgdir/usr/" secushare.pro
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
