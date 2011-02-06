pkgname=capt-lbp
_pkgname=capt
pkgver=0.4
pkgrel=2
pkgdesc="Driver for Canon LBP-810/LBP-1120 using the CAPT protocol"
arch=('i686' 'x86_64')
url="http://www.boichat.ch/nicolas/capt/"
license=('GPL2')
depends=('cups' 'foomatic-db' 'foomatic-filters')
makedepends=('gcc' 'make')
source=(http://www.are-ata.org/debian/${_pkgname}/${_pkgname}-0.4.tar.gz)
md5sums=('3273ea52a94cbba2096483072bc72942')

build() {
  cd "$srcdir/${_pkgname}"
 
  make || return 1
}

package() {
  cd "$srcdir/${_pkgname}"

  install -d -m 755 $pkgdir/{usr/bin,usr/share/cups/model,etc,usr/share/doc/${pkgname}} || return 1

  install -s -m a=rx capt $pkgdir/usr/bin || return 1
  install -m a=rx capt-print $pkgdir/usr/bin || return 1
  install -m a=r ppd/Canon-LBP-810-capt.ppd $pkgdir/usr/share/cups/model || return 1
  install -m a=r etc/capt.conf $pkgdir/etc || return 1

  install -m 644 NEWS README SPECS THANKS TODO $pkgdir/usr/share/doc/${pkgname} || return 1
}

# vim:set ts=2 sw=2 et:
