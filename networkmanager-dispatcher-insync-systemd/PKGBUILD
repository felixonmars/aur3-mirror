# Maintainer: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Robert Orzanna <orschiro@gmail.com>
pkgname=networkmanager-dispatcher-insync-systemd
pkgver=1.2
pkgrel=1
pkgdesc="Systemd dispatcher Script for Insync."
arch=('any')
license=('GPL')
url="https://github.com/rbellamy/pkgbuilds"
depends=('networkmanager' 'insync')
source=('10-insync')
md5sums=('2a009a02f21b4e90f7bc448af255a479')

package() {
  install -dm755 "${pkgdir}/etc/NetworkManager/dispatcher.d/"
  install -m700 "$srcdir/10-insync" "${pkgdir}/etc/NetworkManager/dispatcher.d/10-insync"
}
