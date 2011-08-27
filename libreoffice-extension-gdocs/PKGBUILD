# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libreoffice-extension-gdocs
_pkgname=gdocs
pkgver=2.1.0
pkgrel=3
pkgdesc="LibreOffice extenson to update and import your documents to and from Google Docs, Zoho and WebDAV servers"
arch=('any')
url="http://extensions.services.openoffice.org/project/ooo2gd"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice' 'java-runtime')
makedepends=('unzip')
source=(http://download.go-oo.org/src/${_pkgname}_${pkgver}_modified.oxt)
md5sums=('07fcf44498dc0ab904f2e0d767533327')

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/${_pkgname}_${pkgver}_modified.oxt"
}
