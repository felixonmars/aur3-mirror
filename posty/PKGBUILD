# Contributor: Nathan Owe <ndowens.aur @ gmail.com>
pkgname=posty
pkgver=1.8.2
pkgrel=3
pkgdesc="Adobe AIR twitter/ident.ca client"
arch=('i686' 'x86_64')
url="http://spreadingfunkyness.com/posty/"
license=('unknown')
depends=('adobe-air')
makedepends=('unzip')
source=(http://spreadingfunkyness.com/${pkgname}-download/${pkgname}${pkgver}.air.zip ${pkgname}.sh ${pkgname}.desktop)
md5sums=('3c25020116c3ddb06a873e3be8799969'
         '5b5c2225fe705909ad0890ba551c42c9'
         'f7dba14cbdb4dfd5b1b4fffa4107bc28')

build() {
  cd ${srcdir}/

  install -d ${pkgdir}/{opt/${pkgname},usr/{share/{applications,pixmaps/${pkgname}},bin}}
  unzip ${pkgname}${pkgver}.air
  install -Dm644 postyIcon48x48.png ${pkgdir}/usr/share/pixmaps/${pkgname}/
  install -Dm644 posty${pkgver}.air ${pkgdir}/opt/${pkgname}/${pkgname}.air
  install -Dm755 posty.sh ${pkgdir}/usr/bin/posty
  install ${pkgname}.desktop ${pkgdir}/usr/share/applications/
}
