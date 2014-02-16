# Maintainer: Zejun Wu <zejun.wu+aur@gmail.com>

pkgname=php-imagick-git
pkgver=784.82f7685
pkgrel=1
pkgdesc="PHP extension for IMagick (git version)"
arch=('i686' 'x86_64')
url="https://github.com/mkoppanen/imagick"
license=('PHP')
depends=('php>=5.1.3' 'imagemagick>=6.2.4')
makedepends=('php' 'git')
provides=('php-imagick')
conflicts=('php-imagick')
install=install
source=("git+https://github.com/mkoppanen/imagick.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/imagick"
  local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/imagick"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/imagick"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=imagick.so' > imagick.ini
  install -D -m644 imagick.ini "$pkgdir/etc/php/conf.d/imagick.ini"
}
