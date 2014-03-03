# Maintainer: Colin Keenan <colinnkeenan at gmail dot com>

pkgname=open_choose
pkgver=1.4
pkgrel=1
pkgdesc="'catfish --wrapper=open_choose' for open-with dialog when open file in catfish"
arch=('any')
url="https://github.com/colinkeenan/open_choose"
license=('GPL')
depends=('zenity' 'perl-file-mimeinfo')
install=${pkgname}.install

source=('open_choose')
md5sums=('9b40ab463a80019dfe58856f0190c784')

package() {
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 open_choose "$pkgdir/usr/bin/open_choose"
}
