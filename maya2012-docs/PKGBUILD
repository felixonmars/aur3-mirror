# Maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=maya2012-docs
pkgver=2012.63
pkgrel=3
pkgdesc="Autodesk Maya documentation"
arch=('x86_64')
url="http://www.autodesk.com/maya"
license=('proprietary')
depends=()
makedepends=('rpmextract')
source=(http://images.autodesk.com/adsk/files/autodesk_maya_2012_english_documentation_linux_64bit.tgz)
sha1sums=('996037602f6774183c1c7806d7f092e961301623')
options=('!strip')

build() {
  cd ${pkgdir}
  rpmextract.sh ${srcdir}/Maya2012_0-docs_en_US_64-2012.0-63.x86_64.rpm
  install -Dm644 "$srcdir/EULA/All Other Countries.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if test -d ${pkgdir}/usr/autodesk/maya2012-x64/docs ; then
    find ${pkgdir}/usr/autodesk/maya2012-x64/docs/ -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/autodesk/maya2012-x64/docs/ -type f -exec chmod 644 {} \;
  fi
}
