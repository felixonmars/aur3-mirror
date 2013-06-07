# Maintainer: Oliver Weidner <Oliver.Weidner[at]gmail[dot]com>
pkgname=rfcdiff
pkgver=1.41
pkgrel=1
pkgdesc="rfcdiff is an IETF tool to diff RFCs."
url="http://tools.ietf.org/tools/rfcdiff/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('bash')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("http://tools.ietf.org/tools/rfcdiff/${pkgname}-v${pkgver}")
md5sums=('bf07f6cae31656f69ce21f743e18faaa')

package() {
#  cd "${srcdir}"
  install -Dm755 ${pkgname}-v${pkgver} "$pkgdir/usr/bin/rfcdiff"
}

# vim:set ts=2 sw=2 et:
