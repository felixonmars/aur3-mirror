# custom variables
_hkgname=grapefruit-ui-gtk
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-grapefruit-ui-gtk
pkgver=0.1.0.5
pkgrel=1
pkgdesc="GTK+-based backend for declarative user interface programming"
url="http://grapefruit-project.org/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-colour=2.3.3-57"
         "haskell-fraction=0.1.0.3-1"
         "haskell-glib=0.13.0.7-2"
         "haskell-grapefruit-frp=0.1.0.5-1"
         "haskell-grapefruit-records=0.1.0.5-1"
         "haskell-grapefruit-ui=0.1.0.5-1"
         "haskell-gtk=0.13.4-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("3f91385bada888f49f9b61b8c0bc289675fcd447f875c766044e9c6da5dfda80")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    # no source patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
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
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}"
}
