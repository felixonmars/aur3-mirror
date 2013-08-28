# Maintainer: Alexander Straube <Alexander.Straube@GoogleMail.com>
pkgname=sharp-mx-c26-ps
pkgver=1.2
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(MX-C26)"
arch=('i686' 'x86_64')
url="http://www.sharp.com"
license=('GPL')
depends=('cups')
source=("http://www.sharp.de/cps/rde/xbcr/documents/documents/drv/34_ppc/MXxx_DRV_PPD-Linux-ver12_ALL.tar.gz")
md5sums=('4c77cc29aa34d6cdc9fe7b113e333fee')

package() {
	cd "$srcdir/sharp-1.2-mx-c26-ps/src"
	mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
	tar -C $pkgdir/usr/share/cups/model/Sharp -xf ppd.tar
}
