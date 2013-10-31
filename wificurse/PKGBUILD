pkgname=wificurse
pkgver=0.3.9
pkgrel=1
pkgdesc="WiFi Jammer via fake deauthentication packets"
arch=('i686' 'x86_64')
license=(GPL)
url=https://github.com/oblique/wificurse
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oblique/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('ad76374ce9c13b6aaabec3c7ceda2d104b02c3bd')

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
