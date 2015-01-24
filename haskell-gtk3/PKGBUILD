# custom variables
_hkgname=gtk3
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-gtk3
pkgver=0.13.4
pkgrel=3
pkgdesc="Binding to the Gtk+ graphical user interface library."
url="http://projects.haskell.org/gtk2hs/"
license=("LGPL-2.1")
arch=('i686' 'x86_64')
makedepends=("gtk2hs-buildtools")
depends=("ghc=7.8.4-1"
         "haskell-cairo=0.13.0.6-2"
         "haskell-gio=0.13.0.4-2"
         "haskell-glib=0.13.0.7-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-pango=0.13.0.5-2"
         "haskell-text=1.2.0.4-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("10abee0435f2d2a2e07d28a44ed81e86d7d8c9b9157d6e7c1cb59e7760783e10")

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
        --libsubdir=\$compiler/site-local/\$pkgid \
            -ffmode-binary -f-build-demos -fhave-gio
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
