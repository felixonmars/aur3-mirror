# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-sharelinkcreator-git
_pkgname=shareLinkCreator
pkgver=0a3b51f
pkgrel=1
pkgdesc="Script to upload a file to OwnCloud and receive a link"
arch=(any)
url="https://github.com/schiesbn/shareLinkCreator"
license=('MIT')
depends=('curl' 'xclip' 'zenity')
source=('git+https://github.com/schiesbn/shareLinkCreator.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -D "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 shareLinkCreator "${pkgdir}/usr/bin/sharelinkcreator"
}
