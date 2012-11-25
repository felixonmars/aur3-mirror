# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: Xavier de Labouret <arch@2-lab.net>
pkgname=kye
pkgver=1.0.0
_ver=1.0 #${pkgver%.*}
pkgrel=2
pkgdesc="An addictive action-puzzle game, where you have to collect all the diamonds without getting stucked or eaten"
arch=('any')
url="http://games.moria.org.uk/kye/pygtk"
license=('GPL')
depends=('python2-rsvg')
source=(http://games.moria.org.uk/${pkgname}/download/${pkgname}-${_ver}.tar.gz
  kye.desktop
)
md5sums=('1ad78167bb6a72d3e24f4a20b6dfde73'
         '3ec0827c0788a40b46b2627be84a6efe')

package()
{
  cd ${srcdir}/${pkgname}-${_ver}/
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  mkdir -p ${pkgdir}/usr/share/pixmaps/
  install -D -m644 ${srcdir}/${pkgname}-${_ver}/kye-icon.png ${pkgdir}/usr/share/pixmaps/
  install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  #for convenience
  mv ${pkgdir}/usr/bin/Kye ${pkgdir}/usr/bin/kye
  mv ${pkgdir}/usr/bin/Kye-edit ${pkgdir}/usr/bin/kye-edit
}
