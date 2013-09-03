# Maintainer: Tim Hütz <tim[at]huetz[dot]biz>
pkgname=notificatio-pc
pkgver=0.0.1
pkgrel=1
pkgdesc="Notificatio is the PC daemon for the Android app with the same name :)"
url="https://github.com/thuetz/notificatio-pc"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('bluez-libs')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='notificatio-pc.install'
source=("https://github.com/thuetz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2ca3041cf5010cd050ebd06b25884286fce7d47bfbf5c58ff7b72d4c913b6437')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
