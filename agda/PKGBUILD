# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=Agda
pkgname=agda
pkgver=2.3.2.2
pkgrel=1
pkgdesc="A dependently typed functional programming language and proof assistant"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:OtherLicense')
arch=('i686' 'x86_64')
depends=('haskell-quickcheck' 'haskell-array' 'haskell-binary<0.6' 'haskell-bytestring' 'haskell-containers' 'haskell-deepseq' 'haskell-directory' 'haskell-filepath' 'haskell-geniplate<0.7' 'haskell-hashable<1.3' 'haskell-hashtables<1.2' 'haskell-haskeline<0.8' 'haskell-haskell-src-exts<1.15' 'haskell-mtl' 'haskell-old-time' 'haskell-parallel' 'haskell-pretty' 'haskell-process' 'haskell-text' 'haskell-unordered-containers<0.3' 'haskell-xhtml' 'haskell-zlib' 'happy<2' 'alex<3.2')
options=('staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('ec8cc8bcf6efcaf8d684bc8da6356a1c')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
