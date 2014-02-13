# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=nehe-tuts
pkgname=haskell-nehe-tuts
pkgver=0.2.4
pkgrel=1

pkgdesc="Port of the NeHe OpenGL tutorials to Haskell; so far only lessons 1-12 have been ported."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-cereal' 'haskell-directory' 'haskell-glfw-b>=1.0.0' 'haskell-gluraw' 'haskell-openglraw' 'haskell-random')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=""
sha512sums=('7dd65f05af0f03f256f8ca3a06c573458daf136747b5c2bea80eb1db8134d4eb0c6eda2c0d9db3d7d40652fe23b0739bf799beba1f3e7e2597d3b790ee58f167')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -d -m755 ${pkgdir}/usr/src/haskell
    cp -dr --preserve=mode,timestamp ${srcdir}/${_hkgname}-${pkgver} ${pkgdir}/usr/src/haskell/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -rf ${pkgdir}/usr/share/doc
    cd ${pkgdir}/usr/bin
    for file in `ls`; do mv $file ${_hkgname}-$file; done
}
