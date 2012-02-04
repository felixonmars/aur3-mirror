# Maintainer: Ethan Schoonover <es@ethanschoonover.com>
pkgname=muttjump
pkgver=1.5
pkgrel=1
_gituser=weisslj
_gitcommit=a935aef
pkgdesc="makes mail indexers (like mairix, mu, nmzmail, or notmuch) together with mutt more useful by jumping from virtual maildir search results to actual message."
url="https://github.com/${_gituser}/${pkgname}"
arch=('any')
depends=()
provides=('muttjump')
license=('GPL')
source=("${url}/tarball/v${pkgver}")
md5sums=('7b721fbeb7a01cf2c5a784e6b63e3b9f')

package() {
  cd ${srcdir}/${_gituser}-${pkgname}-${_gitcommit}
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
