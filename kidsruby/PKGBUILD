# Maintainer:  Jesse Jaara      <gmail.com: jesse.jaara>

pkgname=kidsruby
pkgver=1.1
_gitrev=57ed39f
pkgrel=1
pkgdesc="Have fun and make games, or hack your homework using Ruby!"
arch=('any')
url="http://kidsruby.com/"
license=('apache')
depends=('kdebindings-qtruby')
source=("kidsruby-${pkgver}.tar.gz::https://github.com/hybridgroup/kidsruby/tarball/v${pkgver}"
"https://github.com/hybridgroup/kidsrubyinstaller-osx/raw/master/kidsrubylogo.png"
kidsruby.desktop)

package() {
  cd "${srcdir}/hybridgroup-kidsruby-${_gitrev}"

  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/bin"

  cp -r app/ lib/ public/ main.rb "${pkgdir}/usr/share/${pkgname}/"
  cp    ../kidsrubylogo.png	  "${pkgdir}/usr/share/pixmaps/kidsruby.png"
  cp    ../kidsruby.desktop	  "${pkgdir}/usr/share/applications/"


  echo -e "#!/bin/sh\nruby /usr/share/${pkgname}/main.rb" > "${pkgdir}/usr/bin/kidsruby"
  chmod +x "${pkgdir}/usr/bin/kidsruby"  
}
md5sums=('b68f487ce8ab9da51f02cba45e80c912'
         'd82f84db05531ed0baa18e6fecf634d0'
         'ee26d893fad973a11e8eec8c6edf9efe')
