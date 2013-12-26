# custom variables
_hkgname=strict-concurrency
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-strict-concurrency
pkgver=0.2.4.1
pkgrel=1
pkgdesc="Strict concurrency abstractions"
url="http://code.haskell.org/~dons/code/strict-concurrency"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.6.3-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "source.patch")
install="${pkgname}.install"
sha256sums=("0939212dd0cc3b9bd228dfbb233d9eccad22ca626752d9bad8026ceb0a5c1a89"
            "114a389516ab97c61f3e22eeb72509b254da2fae2d48d9dfcd3aae98b1f9a389")

# PKGBUILD functions
build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    patch -p4 < "${srcdir}/source.patch"
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
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
