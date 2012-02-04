# Nickolay Stepanenko <nixtrian@gmail.com>
pkgname=matsuri
pkgrel=1
pkgver=0.0.4
pkgdesc="Ncurses jabber client written in haskell"
url="http://hackage.haskell.org/package/matsuri"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-xmpp-latest' 'haskell-vty-ui' 'haskell-utf8-string' 'haskell-split' 'haskell-missingh' 'haskell-configfile')
#options=('strip')
source=(http://hackage.haskell.org/packages/archive/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
#install=matsuri.install
md5sums=('69640d6f9cf6fb4ab8c0bdce701758bf')
build() {
    cd ${srcdir}/$pkgname-$pkgver
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} || return 1
    runhaskell Setup build                   || return 1
    runhaskell Setup copy --destdir=${pkgdir} || return 1
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
