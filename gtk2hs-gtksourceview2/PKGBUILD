# $Id: PKGBUILD 19743 2010-06-28 16:42:14Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=gtk2hs-gtksourceview2
pkgrel=1
pkgver=0.11.0
pkgdesc="Binding to the gtksourceview2 library for Gtk2Hs."
url="http://hackage.haskell.org/package/gtksourceview2"
license=('LGPL2.1')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-cabal' 'haskell-containers' 'haskell-haskell98' 'gtk' 'gtk2hs-buildtools' 'gtksourceview2')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/gtksourceview2/$pkgver/gtksourceview2-$pkgver.tar.gz)
install=gtk2hs-gtksourceview2.install
md5sums=('d056065cbcfadd8252ecbe661ee2ab6c')

build() {
    cd ${srcdir}/gtksourceview2-$pkgver
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} || return 1
    runhaskell Setup build                   || return 1
    runhaskell Setup haddock || return 1
    runhaskell Setup register   --gen-script || return 1
    runhaskell Setup unregister --gen-script || return 1
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/$pkgname/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/$pkgname/unregister.sh
    install -d -m755 $pkgdir/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/gtksourceview2
    runhaskell Setup copy --destdir=${pkgdir} || return 1
}
md5sums=('3493eb93f0c1973cdd213953d69b290f')
