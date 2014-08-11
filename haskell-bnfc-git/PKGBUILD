_hkgname='BNFC'
# custom variables
pkgname=haskell-bnfc-git
pkgver=r1.0d7c8e3
pkgrel=1
pkgdesc="A compiler front-end generator."
url="http://bnfc.digitalgrammars.com/"
license=("GPL2")
arch=('i686' 'x86_64')
makedepends=('git')
depends=("ghc=7.8.3-1"
         "haskell-mtl=2.1.3.1-4")
options=('strip' 'staticlibs')
source=("$pkgname"::"git://github.com/BNFC/bnfc.git")
install="${pkgname}.install"
sha256sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}/source"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${pkgname}/source"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
