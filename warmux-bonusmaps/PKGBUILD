# Author dieghen89 <dieghen89@gmail.com>
pkgname=warmux-bonusmaps
pkgver=20100501
pkgrel=1
source=(http://download.gna.org/warmux/Wormux-BonusMaps-${pkgver}.tar.gz)
arch=('i686' 'x86_64')
license=('GPL')
depends=('wormux')
url="http://www.wormux.org"
pkgdesc="Some bonus maps for the wormux game"
md5sums=('c6c969dbe3dabdef95fb3a99bb6bbeda')

build()
{
cd ${srcdir}
mkdir -p ${pkgdir}/usr/share/wormux/map/
cp -r * ${pkgdir}/usr/share/wormux/map/
}
