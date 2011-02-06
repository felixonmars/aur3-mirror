# Contributor: Vladimir Matveev <dpx.infinity at gmail point com>
# Fixed 0.3 version of haskell-dbus-client package
pkgname=haskell-dbus-client3
_pkgname=haskell-dbus-client
pkgrel=1
pkgver=0.3
pkgdesc="Monadic and object-oriented interfaces to DBus"
url="http://hackage.haskell.org/package/dbus-client"
license=('GPL-3')
arch=('i686' 'x86_64')
provides=('haskell-dbus-client=0.3')
conflicts=('haskell-dbus-client')
makedepends=()
depends=('ghc' 'haskell-cabal' 'haskell-containers' 'haskell-dbus-core' 'haskell-text')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/dbus-client/0.3/dbus-client-0.3.tar.gz)
install=haskell-dbus-client.install
md5sums=('ec4ec473a658d183fb2cf2cd99aed6a7')
build() {
    cd ${srcdir}/dbus-client-0.3
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${_pkgname} || return 1
    runhaskell Setup build                   || return 1
    runhaskell Setup haddock || return 1
    runhaskell Setup register   --gen-script || return 1
    runhaskell Setup unregister --gen-script || return 1
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/$_pkgname/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/$_pkgname/unregister.sh
    install -d -m755 $pkgdir/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${_pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/dbus-client
    runhaskell Setup copy --destdir=${pkgdir} || return 1
}
