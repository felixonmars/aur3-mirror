# Maintainer: Arthur Skowronek <eisensheng@mailbox.org>

pkgname=deis-cli
pkgver=1.2.2
pkgrel=1
pkgdesc="Interact with a Deis Controller,  an open source PaaS that makes it easy to deploy and manage applications on your own servers."
arch=(any)
url="https://pypi.python.org/pypi/deis/"
license=('custom:apache-2.0')
makedepends=('pex')
depends=('python2')
options=(!emptydirs)
source=('apache-2.0.txt::https://www.apache.org/licenses/LICENSE-2.0.txt'
        "https://pypi.python.org/packages/source/d/deis/deis-${pkgver}.zip")
md5sums=('3b83ef96387f14655fc854ddc3c6bd57'
         'b887c12b3b74b8e43aa4967bcfa976c3')

build() {
  cd "$srcdir/deis-$pkgver"
  pex -v -s . -e deis:main -o deis
}

package() {
  install -Dm755 "${srcdir}/deis-$pkgver/deis" "${pkgdir}/usr/bin/deis"
  install -Dm444 "${srcdir}/apache-2.0.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
