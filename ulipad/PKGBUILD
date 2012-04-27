# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nicolás de la Torre <ndelatorre@gmail.com>

pkgname=ulipad
pkgver=4.1
pkgrel=1
pkgdesc="A wxPython powered, programmer oriented and flexible editor"
arch=('any')
url="http://code.google.com/p/ulipad/"
license=('GPL')
depends=('wxpython')
optdepends=('psyco: speed support'
            'python2-pyenchant: spell-checking support')
source=("http://ulipad.googlecode.com/files/${pkgname}.${pkgver}.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('3328cad1f97f8315d63249a6ff06b717'
         '088feea9980edd118c7297e6d45613af'
         '8179bab501c1eea2a799f497292b4549'
         '23cdc38822e51dc6ffaa86dff94d967d')

package() {
  cd "${srcdir}/${pkgname}"

  # Python 2 fix
  find . -name "*.py*" -exec sed -i "s_env python_&2_" '{}' \;
  sed -i "s_/usr/bin/python_&2_" modules/pep8.py

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mv *.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r ./* "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
