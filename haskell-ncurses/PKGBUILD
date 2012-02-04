# custom variables
_hkgname=ncurses
_licensefile=license.txt

# PKGBUILD options/directives
pkgname=haskell-ncurses
pkgver=0.2
pkgrel=1
pkgdesc="Modernised bindings to GNU ncurses"
url="http://john-millikin.com/software/bindings/ncurses/"
license=("GPL-3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-containers=0.4.0.0"
         "haskell-text=0.11.0.5"
         "haskell-transformers=0.2.2.0"
         "ncurses")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("dd5c59ef7fdea903534a93165ccd52f1daa2396c7138352648490f88120db60b")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    #NP
    find . -name '*.c*' -print0 | xargs -0 \
      sed -ie 's,ncursesw/,,g'
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
