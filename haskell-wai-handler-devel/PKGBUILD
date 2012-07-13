# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arch Haskell Team <>

pkgname=haskell-wai-handler-devel
pkgver=1.2.0.2
_hkgname=wai-handler-devel
_licensefile=LICENSE
pkgrel=1
pkgdesc="WAI server that automatically reloads code after modification."
url="http://github.com/snoyberg/wai-handler-devel"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-attoparsec'
         'haskell-bytestring'
         'haskell-cmdargs'
         'haskell-directory'
         'haskell-hint'
         'haskell-http-types'
         'haskell-network'
         'haskell-old-time'
         'haskell-text'
         'haskell-transformers'
         'haskell-wai'
         'haskell-wai-extra'
         'haskell-warp')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('20e9a0e47950da7140997032bb66dd3f2d104c7a4d8292bc132ae5271721d42e')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
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
