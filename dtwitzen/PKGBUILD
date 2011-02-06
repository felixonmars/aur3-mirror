# Contributor: Konstantinos Koukopoulos <koukopoulos at gmail dot com>
pkgname=dtwitzen
pkgrel=1
pkgver=0.2
pkgdesc="A compact twitter client for dzen."
url="http://ooxo.org/dtwitzen"
license=('custom:OtherLicense')
arch=('i686' 'x86_64')
makedepends=()
depends=('dzen2' 'ghc' 'haskell-hxt' 'haskell-http' 'haskell-base64-string' 'haskell-utf8-string')
options=('strip')
source=(http://ooxo.org/dtwitzen/dtwitzen-0.2.tar.gz)
md5sums=('90c9142548315634abc4691b0a064f39')
build() {
    cd ${srcdir} && patch -p0 < ${startdir}/http4.diff
    cd ${srcdir}/dtwitzen-0.2
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} || return 1
    runhaskell Setup build                   || return 1
    runhaskell Setup copy --destdir=${pkgdir} || return 1
    install -D -m644 ${pkgdir}/usr/share/doc/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
