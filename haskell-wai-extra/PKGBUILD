# Maintainer: Leif Warner <abimelech@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gour <gour@atmarama.net>

pkgname=haskell-wai-extra
_hkgname=wai-extra
_licensefile=LICENSE
pkgver=2.0.1
pkgrel=1
pkgdesc="Provides some basic WAI handlers and middleware."
url="http://hackage.haskell.org/package/wai-extra"
license=("BSD3")
arch=('i686' 'x86_64')
depends=('haskell-ansi-terminal'
         'haskell-blaze-builder'
         'haskell-blaze-builder-conduit'
         'haskell-bytestring'
         'haskell-case-insensitive'
         'haskell-conduit'
         'haskell-data-default'
         'haskell-directory'
         'haskell-fast-logger'
         'haskell-http-types'
         'haskell-network'
         'haskell-old-locale'
         'haskell-resourcet'
         'haskell-stringsearch'
         'haskell-text'
         'haskell-time'
         'haskell-transformers'
         'haskell-wai'
         'haskell-zlib-conduit')
options=('staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
md5sums=('f58e3d0284e62cc85c5461f8a591a45d')
install="${pkgname}.install"

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
