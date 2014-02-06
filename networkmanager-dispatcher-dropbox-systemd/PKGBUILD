# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=networkmanager-dispatcher-dropbox-systemd
pkgver=1.0
pkgrel=2
pkgdesc="Dispatcher Script for Dropbox using its systemd service file."
arch=('any')
license=('GPL')
url="https://github.com/orschiro/PKGBUILD"
depends=('networkmanager' 'dropbox')
conflicts=('networkmanager-dispatcher-dropbox')
source=('10-dropboxd')
md5sums=('50103e0049aa084ef62742e4a0a68d57')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 10-dropboxd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-dropboxd"
}