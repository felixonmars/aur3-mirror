# Submitter: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=fusioninvoice-git
_pkgname=fusioninvoice
pkgver=d76e19d
pkgrel=1
pkgdesc="Self hosted invoicing for freelancers and small businesses"
arch=(any)
url="https://github.com/freeskys"
license=('MIT')
depends=('php')
optdepends=('php-mysql: for MySQL database support')
source=('git+https://github.com/freeskys/fusioninvoice.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${_pkgname}"
  cd "${srcdir}/${_pkgname}"
  install -D "license.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  cp -rv . "${pkgdir}/usr/share/webapps/${_pkgname}"
}
