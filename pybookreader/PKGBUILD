# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Shuthdar <shuthdar@gmail.com>

pkgname=pybookreader
pkgver=0.5.0
pkgrel=3
pkgdesc="A PyGTK-based GUI book reader"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pybookreader/"
license=('GPL')
depends=('pygtk')
source=("http://downloads.sourceforge.net/${pkgname}/PyBookReader-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "ornamentbook.desktop")
md5sums=('9c36e3c8f3910884655bb9f87ae45374'
         '8cc330c4b57da758604fd402894ba53a'
         'da5df271ead7727b1255012802a5141e'
         'b203db6b736c04a7c97c381904a8334e')

package() {
  cd "${srcdir}/PyBookReader-${pkgver}"

  # Python 2 fix
  sed -i "s_env python_&2_" */*.py pybookreader/dictclient/*.py
  sed -i "s_bin/python_&2_" */*.py

  # Install program files
  python2 setup.py install --prefix="${pkgdir}/usr"

  # Install launchers
  echo 'PYTHONPATH=/usr/lib/python2.7 pybr' > "${pkgdir}/usr/bin/pybookreader"
  echo 'PYTHONPATH=/usr/lib/python2.7 ob' > "${pkgdir}/usr/bin/ornamentbook"
  chmod 755 "${pkgdir}/usr/bin/"{pybookreader,ornamentbook}

  # Install desktop entries
  mkdir -p "${pkgdir}/usr/share/applications"
  install -m644 ../*.desktop "${pkgdir}/usr/share/applications"
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
