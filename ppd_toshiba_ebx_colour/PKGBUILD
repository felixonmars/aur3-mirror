# Author: JP-Ellis <coujellis@gmail.com>

pkgname="ppd_toshiba_ebx_colour"
pkgver=7.22
pkgrel=1
pkgdesc="PPD files for e-STUDIO 347cs, 407cs, 2050c, 2550c, 2040c, 2540c, 3040c, 3540c, 4540c, 2555c, 3055c, 3555c, 4555c, 5055c, 5540c, 6540c, 6550c, 5560c, 6560c, 6570c"
url="http://www.eid.toshiba.com.au/n_driver_ebx_colour.asp"
arch=('any')
license=('proprietary')
depends=('cups')
source=("http://www.eid.toshiba.com.au/drivers/eBX/eBX_CUPS_Colour_V$pkgver.zip")
md5sums=('2e450664cf34c8c4aed92fb76bf82d2d')

package() {
    tar -xf eBX_CUPS_Colour_V$pkgver/normal/TOSHIBA_ColorMFP_CUPS.tar -C "$pkgdir"
    cd "$pkgdir"/usr/share/cups/model/Toshiba
    mv TOSHIBA_ColorMFP_CUPS.gz TOSHIBA_ColorMFP_CUPS.ppd.gz
}
