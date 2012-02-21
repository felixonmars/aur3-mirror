# Maintainer: Nicolas Estibals <Nicolas.Estibals@gmail.com>
# Contributor: gammel.holte
pkgname=mutt-notmuch
pkgver=0.2
pkgrel=1
pkgdesc="Notmuch (of a) helper for Mutt"
url="https://gitorious.org/mutt-notmuch"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-mailtools' 'perl-mail-box' 'notmuch' 'perl-term-readline-gnu')
source=("${pkgname}-${pkgver}.tar.gz::https://gitorious.org/${pkgname}/${pkgname}/archive-tarball/${pkgver}")
sha1sums=('c4492469ba0351a7c9b97202a40e6b6931d9796b')


build() {
  cd "${srcdir}"/${pkgname}-${pkgname}
  make ${pkgname}.1
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgname}
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
