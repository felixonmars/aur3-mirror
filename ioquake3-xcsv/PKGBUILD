# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=ioquake3-xcsv
pkgver=1
pkgrel=1
pkgdesc="High-Resolution Creative Commons Texture Replacement Pack for ioquake3"
arch=('any')
url="http://ioquake3.org"
license=('CCPL')
depends=('ioquake3')
source=(http://ioquake3.org/files/xcsv_hires.zip)
md5sums=('1e15b9207988196a64ad4b25e7c0d7c6')

package() {
    install -Dm 644 ${srcdir}/xcsv_bq3hi-res.pk3 ${pkgdir}/opt/quake3/baseq3/xcsv_bq3hi-res.pk3
}
