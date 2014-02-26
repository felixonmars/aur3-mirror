# Maintainer: Colin Keenan <colinnkeenan at gmail dot com>

pkgname=open_choose
pkgver=1.3
pkgrel=1
pkgdesc="'catfish --wrapper=open_choose' for open-with dialog when open file in catfish"
arch=('any')
url="https://github.com/colinkeenan/open_choose"
license=('GPL')
depends=('zenity' 'perl-file-mimeinfo')
install=${pkgname}.install

source=('open_choose')
md5sums=('807328a8bc395bdb23cccfe2e61f2d8e')

package() {
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 open_choose "$pkgdir/usr/bin/open_choose"
}
