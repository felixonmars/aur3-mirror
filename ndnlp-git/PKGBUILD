# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=ndnlp
pkgname=${_pkgname}-git
pkgver=27.bb5c4d9
pkgrel=4
pkgdesc="Named Data Networking Link Protocol"
arch=('i686' 'x86_64')
url="https://github.com/NDN-Routing/NDNLP"
license=('unknown')
depends=('ccnx')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+https://github.com/NDN-Routing/NDNLP.git"
         'ndnld.service')
md5sums=('SKIP'
         '63b37edcc226c1b56114ae1380cb3325')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"
  unset CPPFLAGS
  ./waf configure --debug --prefix=/usr
  ./waf
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR=${pkgdir} ./waf install
  install -Dm644 "${srcdir}/ndnld.service" "${pkgdir}/usr/lib/systemd/system/ndnld.service"
}

# vim:set ts=2 sw=2 et:
