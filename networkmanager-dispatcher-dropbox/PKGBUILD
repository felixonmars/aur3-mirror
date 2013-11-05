# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=networkmanager-dispatcher-dropbox
pkgver=1.1
pkgrel=2
pkgdesc="Dispatcher script for Dropbox"
arch=('any')
license=('BSD')
url="http://www.gnome.org/projects/NetworkManager/"
depends=('networkmanager' 'dropbox')
source=('10-dropboxd')
backup=('etc/NetworkManager/dispatcher.d/20-dropboxd')
md5sums=('63b96ef8eea046e2b5b256f85ce6f571')
install=dispatcher-dropbox.install

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 10-dropboxd "${pkgdir}/etc/NetworkManager/dispatcher.d/10-dropboxd"
}

