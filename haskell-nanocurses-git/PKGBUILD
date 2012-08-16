# Maintainer: Arch Haskell Team <arch-haskell@haskell.org>
# Contributor: iv597 <j@iv597.com>
_hkgname=nanocurses
pkgname=haskell-nanocurses-git
pkgver=20120805
pkgrel=1
pkgdesc="Simple Curses binding (Fixed for GHC 7.4)"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('git')
depends=('ghc' 'haskell-bytestring' 'haskell-unix' 'ncurses')
options=('strip')
source=()
install=${pkgname}.install

_gitroot="https://github.com/dumbhat/nanocurses.git"
_gitname="nanocurses"

build() {
    # grab from git
    cd "$srcdir"
        if [ -d $_gitname ] ; then
            cd $_gitname && git pull origin
            msg "Local files updated"
        else
            git clone $_gitroot $_gitname
        fi
    
    msg "GIT checkout done or server timeout"
    msg "Building..."

    cd ${srcdir}/${_gitname}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_gitname}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
