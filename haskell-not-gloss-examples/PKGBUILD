# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=not-gloss-examples
pkgname=haskell-not-gloss-examples
pkgver=0.4.0
pkgrel=1

pkgdesc='Examples for the not-gloss library.'

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-glut' 'haskell-linear>=1.3.1' 'haskell-not-gloss>=0.6.0'
         'haskell-spatial-math>=0.2.0' 'haskell-spatial-math<0.3' 'haskell-x11')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=""
sha512sums=('abd8c50a003b62f4fd441831231fd36d2b755aa3594b9a7264f4d02db4e35af8a492ad11bb77c62413ee2ec18261913103a7cc0b81fb46aaa5227b8206641814')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
#    runhaskell Setup haddock
#    runhaskell Setup register   --gen-script
#    runhaskell Setup unregister --gen-script
#    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -d -m755 ${pkgdir}/usr/src/haskell
    cp -dr --preserve=mode,timestamp ${srcdir}/${_hkgname}-${pkgver}/src ${pkgdir}/usr/src/haskell/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -rf ${pkgdir}/usr/share/doc
    cd ${pkgdir}/usr/bin
#   for file in `ls`; do mv $file ${_hkgname}-$file; done
}
