# Syco <SycoLTH at gmail dot com>

pkgname=jnote
_pkgname=JNote
pkgver=1.0
pkgrel=0
pkgdesc="GNOME note applet written in Java/GTK."
arch=('i686' 'x86_64')
url="http://www.albertorinaudo.info"
license=('GPL')
depends=('jre' 'java-gnome')
source=(http://www.thechosenbyte.com/portfolio/downloads/${_pkgname}-${pkgver}/${_pkgname}.tar.gz)
md5sums=('187f6f0a769b72b3c1c76c75ef80a145')

build () {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${_pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/applications/
  cp ${srcdir}/${_pkgname}.jar ${pkgdir}/opt/${_pkgname}/${_pkgname}.jar
  ln -s /usr/share/java/ ${pkgdir}/opt/${_pkgname}/lib
  cp ${srcdir}/${_pkgname}.png ${pkgdir}/opt/${_pkgname}/${_pkgname}.png
  cp ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/
  cp ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  cp ${srcdir}/${_pkgname}_auto.desktop ~/.config/autostart/${_pkgname}.desktop
}
