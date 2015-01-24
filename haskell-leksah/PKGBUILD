# custom variables
_hkgname=leksah
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-leksah
pkgver=0.14.4.0
pkgrel=1
pkgdesc="Haskell IDE written in Haskell"
url="http://www.leksah.org"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-quickcheck=2.7.6-5"
         "haskell-binary-shared=0.8.3-4"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-conduit=1.2.3.1-4"
         "haskell-executable-path=0.0.3-3"
         "haskell-ghcjs-codemirror=0.0.0.1-2"
         "haskell-ghcjs-dom=0.1.1.3-3"
         "haskell-gio=0.13.0.4-2"
         "haskell-glib=0.13.0.7-2"
         "haskell-gtk3=0.13.4-3"
         "haskell-gtksourceview3=0.13.1.2-3"
         "haskell-hamlet=1.2.0-4"
         "haskell-haskell-src-exts=1.16.0.1-4"
         "haskell-hlint=1.9.16-1"
         "haskell-hslogger=1.2.6-2"
         "haskell-jsaddle=0.2.0.3-1"
         "haskell-leksah-server=0.14.3.2-1"
         "haskell-lens=4.7-2"
         "haskell-ltk=0.14.3.0-4"
         "haskell-mtl=2.1.3.1-5"
         "haskell-network=2.6.0.2-2"
         "haskell-network-uri=2.6.0.1-5"
         "haskell-parsec=3.1.8-1"
         "haskell-pretty-show=1.6.8-3"
         "haskell-regex-base=0.93.2-58"
         "haskell-regex-tdfa=1.2.0-66"
         "haskell-regex-tdfa-text=1.0.0.2-4"
         "haskell-shakespeare=2.0.2.2-1"
         "haskell-strict=0.3.2-57"
         "haskell-text=1.2.0.4-1"
         "haskell-utf8-string=0.3.8-3"
         "haskell-vado=0.0.3-4"
         "haskell-vcsgui=0.1.1.0-4"
         "haskell-vcswrapper=0.1.1-4"
         "haskell-webkitgtk3=0.13.1.1-3"
         "haskell-webkitgtk3-javascriptcore=0.13.0.3-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("5bf4f132e1fb7c6b8c2a68d248812c7bc3c61c0e76becee293ef223d6874e68e")

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
            -fnetwork-uri -f-loc -fgtk3 -f-threaded -fdyre -f-yi
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
