# Maintainer: Joel Pedraza <pkgs-at-joelpedraza-dot-com>
# Contributor: Manuel "ekerazha" C. (www.ekerazha.com)

pkgname=pysqlitegui
pkgver=0.0.8RC0
pkgrel=5
pkgdesc="A GUI tool for creating and managing SQLite databases"
arch=('any')
url="https://github.com/slashmili/PySQLiteGUI"
license=('GPL')
depends=('pygtk' 'python2-pysqlite' 'python2-pysqlite-legacy')
source=("http://mirror.umd.edu/download.ospdev.net/${pkgname}/${pkgname}/${pkgver}/pySQLiteGUI-${pkgver}.tar.bz2"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('ee1410da30b4bf9f9994bed4373c184d'
         '0a3f5da358f69d0788db8071a646316c'
         'b18d9922743ca03de908fc43b134861c')

package() {
  cd "${srcdir}/pySQLiteGUI/src"

  # Fix data path and python2 error
  sed -i "s_psqlitegui.glade_/usr/share/${pkgname}/&_" ${pkgname}.py
  sed -i "s_env python_&2_" ${pkgname}.py

  # Install program files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 psqlitegui.glade{,p} "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 ${pkgname}.py "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
