# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=adesklet-weatherforecast
pkgver=0.2.2
pkgrel=3
pkgdesc="Extended weather desklet that shows three day forecast."
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL2')
depends=('adesklets')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/weatherforecast-${pkgver}.tar.bz2 \
        liquid_45.png \
        liquid_46.png \
        liquid_47.png \
        um_46.png)
sha256sums=('8a1cc4d0d0e728241c7bad10bf5bda4c6aa25ff38c3291d7c2af67bfcbedf6e5'
            '7214c7b9cd5706a62fd7f71cdc43149f4b9acbd0de5d8704ebed86d324d8f545'
            '60c2445a20f18a0ffdc8fd24d596db87428f951ae170d77c7a00c1c4a1f4fa87'
            'b7e2a5fb330aba189db9136d73e95772bc30c5b388c63f1f90bc5a9437a20e89'
            'd55d1cffa137d9654d0fde6f1a80ec9c739d52d8f5731763625116e4e82da3d2')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/adesklets/weatherforecast"

  cp -a "${srcdir}"/weatherforecast-${pkgver}/* "${pkgdir}/usr/share/adesklets/weatherforecast/"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/weatherforecast/weatherforecast.py"

#page changed to xml.weather.com
  sed -i 's/xoap/xml/' "${pkgdir}/usr/share/adesklets/weatherforecast/weatherforecast.py"

#Fixing missing icons
  cp "${srcdir}/weatherforecast-$pkgver/icons/liquid/25.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/liquid/na.png"
  cp "${srcdir}/liquid_45.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/liquid/45.png"
  cp "${srcdir}/liquid_46.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/liquid/46.png"
  cp "${srcdir}/liquid_47.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/liquid/47.png"
  cp "${srcdir}/weatherforecast-$pkgver/icons/um/25.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/um/na.png"
  cp "${srcdir}/um_46.png" "${pkgdir}/usr/share/adesklets/weatherforecast/icons/um/46.png"

  chown root:adesklets "${pkgdir}/usr/share/adesklets/weatherforecast"
  chmod 775 "${pkgdir}/usr/share/adesklets/weatherforecast"
}
