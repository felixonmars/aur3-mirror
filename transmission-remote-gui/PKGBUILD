# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

pkgbase=transmission-remote-gui
pkgname=transmission-remote-gui
true && pkgname=(transmission-remote-gui-gtk2 transmission-remote-gui-qt4)
_pkgname=transgui
pkgver=4.1
pkgrel=2
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=(i686 x86_64)
url='http://code.google.com/p/transmisson-remote-gui/'
license=(GPL2)
makedepends=(lazarus gtk2 qt4pas unzip)
provides=(${pkgbase})
conflicts=(transmission-remote-gui-svn)
install=${pkgbase}.install
source=(http://transmisson-remote-gui.googlecode.com/files/${_pkgname}-${pkgver}-src.zip
       ${_pkgname}.desktop)
md5sums=(4497099a6e36867077ea383b8e565299
         cf55fd5a681d9b34a1f9c7d91b74d121)

prepare() {
  cd ${srcdir}

  cp -a TransGUI ${_pkgname}-gtk2
  cp -a TransGUI ${_pkgname}-qt4

  mkdir config-gtk2
  mkdir config-qt4
}

build() {
  cd ${srcdir}/${_pkgname}-gtk2
  lazbuild ${_pkgname}.lpi --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 \
    --primary-config-path=${srcdir}/config-gtk2

  cd ${srcdir}/${_pkgname}-qt4
  lazbuild ${_pkgname}.lpi --lazarusdir=/usr/lib/lazarus --widgetset=qt \
    --primary-config-path=${srcdir}/config-qt4
}

make_package() {
  install -D -m 755 units/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lang
  install -D -m 644 lang/transgui.* ${pkgdir}/usr/share/${_pkgname}/lang
  rm ${pkgdir}/usr/share/${_pkgname}/lang/transgui.template

  install -d -m 755 ${pkgdir}/usr/share/doc/${pkgname}
  install -D -m 644 readme.txt history.txt LICENSE.txt ${pkgdir}/usr/share/doc/${pkgname}

  install -D -m 644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}

package_transmission-remote-gui-gtk2() {
  depends=(gtk2 desktop-file-utils)
  conflicts+=(${pkgbase}-qt4)

  cd ${srcdir}/${_pkgname}-gtk2
  make_package
}

package_transmission-remote-gui-qt4() {
  depends=(qt4pas)
  conflicts+=(${pkgbase}-gtk2)

  cd ${srcdir}/${_pkgname}-qt4
  make_package
}
