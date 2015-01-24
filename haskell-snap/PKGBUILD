# custom variables
_hkgname=snap
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-snap
pkgver=0.13.3.2
pkgrel=2
pkgdesc="Top-level package for the Snap Web Framework"
url="http://snapframework.com/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-monadcatchio-transformers=0.3.1.0-58"
         "haskell-aeson=0.8.0.2-9"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-cereal=0.4.1.1-1"
         "haskell-clientsession=0.9.1.1-5"
         "haskell-comonad=4.2.2-12"
         "haskell-configurator=0.3.0.0-3"
         "haskell-directory-tree=0.12.0-1"
         "haskell-dlist=0.7.1-3"
         "haskell-errors=1.4.7-4"
         "haskell-hashable=1.2.3.1-2"
         "haskell-heist=0.14.0.1-3"
         "haskell-lens=4.7-2"
         "haskell-logict=0.6.0.2-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-mwc-random=0.13.3.0-1"
         "haskell-pwstore-fast=2.4.4-3"
         "haskell-regex-posix=0.95.2-58"
         "haskell-snap-core=0.9.6.4-3"
         "haskell-snap-server=0.9.4.6-3"
         "haskell-stm=2.4.4-2"
         "haskell-syb=0.4.4-1"
         "haskell-text=1.2.0.4-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-vector=0.10.12.2-2"
         "haskell-vector-algorithms=0.6.0.3-7"
         "haskell-xmlhtml=0.2.3.4-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "source.patch")
install="${pkgname}.install"
sha256sums=("3733879096fef9dd5e2e8d211a5dbede74161fc73e974db65b137fc4b968dacc"
            "8e5744efdaa6f9f8bec91d0586e549b4b5839d6f0134cd716201b668b99ba90c")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    patch -p4 < "${srcdir}/source.patch"
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -f-old-base
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
