# Maintainer: Arthur Gautier <superbaloo@superbaloo.net>
pkgname=php-zmq
pkgver=0.6.0
pkgrel=1
pkgdesc="Php-zmq"
url="https://github.com/mkoppanen/php-zmq"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('php' 'zeromq')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='php-zmq.install'
source=("http://cloud.github.com/downloads/mkoppanen/${pkgname}/zmq-${pkgver}.tgz" "php-zmq.install")
md5sums=('aaba54df8ee1c5b4fc851854af7b9c0f' '7fa22f0cff64d60617a49a578acc24f1')

build() {
  cd "${srcdir}/zmq-${pkgver}"
  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/zmq-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
