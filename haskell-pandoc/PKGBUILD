# custom variables
_hkgname=pandoc
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-pandoc
pkgver=1.13.2
pkgrel=2
pkgdesc="Conversion between markup formats"
url="http://johnmacfarlane.net/pandoc"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('alex' 'happy')
depends=("ghc=7.8.4-1"
         "haskell-http=4000.2.19-3"
         "haskell-juicypixels=3.2.1-1"
         "haskell-sha=1.6.4.1-3"
         "haskell-aeson=0.8.0.2-8"
         "haskell-base64-bytestring=1.0.0.1-57"
         "haskell-blaze-html=0.7.0.3-4"
         "haskell-blaze-markup=0.6.2.0-1"
         "haskell-data-default=0.5.3-59"
         "haskell-deepseq-generics=0.1.1.2-2"
         "haskell-extensible-exceptions=0.1.1.4-57"
         "haskell-haddock-library=1.1.1-2"
         "haskell-highlighting-kate=0.5.11.1-3"
         "haskell-hslua=0.3.13-2"
         "haskell-http-client=0.4.6.1-4"
         "haskell-http-client-tls=0.2.2-28"
         "haskell-http-types=0.8.5-10"
         "haskell-mtl=2.1.3.1-5"
         "haskell-network=2.6.0.2-2"
         "haskell-network-uri=2.6.0.1-4"
         "haskell-pandoc-types=1.12.4.1-16"
         "haskell-parsec=3.1.7-3"
         "haskell-random=1.1-1"
         "haskell-scientific=0.3.3.3-5"
         "haskell-syb=0.4.2-3"
         "haskell-tagsoup=0.13.3-3"
         "haskell-temporary=1.2.0.3-3"
         "haskell-texmath=0.8.0.1-3"
         "haskell-text=1.2.0.3-1"
         "haskell-unordered-containers=0.2.5.1-5"
         "haskell-vector=0.10.12.2-2"
         "haskell-xml=1.3.13-64"
         "haskell-yaml=0.8.10.1-7"
         "haskell-zip-archive=0.2.3.5-4"
         "haskell-zlib=0.5.4.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("e65c445f4454e9efcf1bc8c28754260d7108803bd8979bc2ff3c34705e386d8a")

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
            -fold-locale -fnetwork-uri -f-make-pandoc-man-pages -fhttps -f-trypandoc -f-embed_data_files
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

    # man pages must be installed manually
    install -D -m744 man/man1/pandoc.1          "${pkgdir}/usr/share/man/man1/pandoc.1"
    install -D -m744 man/man5/pandoc_markdown.5 "${pkgdir}/usr/share/man/man5/pandoc_markdown.5"
}
