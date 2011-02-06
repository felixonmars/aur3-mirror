# Contributor: Nixtrian@gmail.com
pkgname=haskell-xmpp-latest
provides="haskell-xmpp=0.1.2"
pkgrel=1
pkgver=0.1.2
pkgdesc="XMPP library"
url="http://hackage.haskell.org/package/XMPP"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('haskell-hsdns-latest' 'ghc' 'haskell-cabal' 'haskell-utf8-string')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/XMPP/0.1.2/XMPP-0.1.2.tar.gz)
install=haskell-xmpp.install
md5sums=('4dd16978ca5669b239926a2b38d2893e')
build() {
    cd ${srcdir}/XMPP-0.1.2
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/haskell-xmpp || return 1
    runhaskell Setup build                   || return 1
    runhaskell Setup haddock || return 1
    runhaskell Setup register   --gen-script || return 1
    runhaskell Setup unregister --gen-script || return 1
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/haskell-xmpp/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/haskell-xmpp/unregister.sh
    install -d -m755 $pkgdir/usr/share/doc/ghc/libraries
    ln -s /usr/share/doc/haskell-xmpp/html ${pkgdir}/usr/share/doc/ghc/libraries/XMPP
    runhaskell Setup copy --destdir=${pkgdir} || return 1
    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/haskell-xmpp/LICENSE || return 1
    rm -f ${pkgdir}/usr/share/doc/haskell-xmpp/LICENSE
}
