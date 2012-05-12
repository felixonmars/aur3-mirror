# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=dbedit
_project=DBEdit
pkgver=2.4.6
pkgrel=1
pkgdesc="Database editor, suitable as front-end for all your relational databases."
arch=('any')
url="http://dbedit2.sourceforge.net/"
license=('GPL3')
depends=('java-environment' 'hicolor-icon-theme')
install=dbedit.install
source=("http://downloads.sf.net/sourceforge/${pkgname}2/${_project}${pkgver}.tar.gz"
        dbedit.desktop)
md5sums=('dc8149f9c8eba2009d6e5379866ede2c'
         '8bf99fb9e3b84d6435a073950c38b134')

build() {
  cd "${srcdir}/${_project}"

  sed -i "s:\`dirname \"\$0\"\`:/usr/share/java/${pkgname}:" dbedit
}

package() {
  cd "${srcdir}/${_project}"

  mkdir -p "${pkgdir}/usr/share/java/${pkgname}/"
  install -Dm644 * "${pkgdir}/usr/share/java/${pkgname}/"
  rm "${pkgdir}/usr/share/java/${pkgname}/"{license.txt,dbedit{,.png}}
  install -DTm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DTm644 dbedit.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/dbedit.png"
  install -DTm644 ../dbedit.desktop "${pkgdir}/usr/share/applications/dbedit.desktop"
  install -Dm755 dbedit "${pkgdir}/usr/bin/dbedit"
}

# vim:set ts=2 sw=2 et:
