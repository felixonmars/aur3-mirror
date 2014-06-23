# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=Elm
pkgname=haskell-elm
pkgver=0.12.3
pkgrel=1
pkgdesc="The Elm language module."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-aeson' 'haskell-aeson-pretty' 'haskell-binary'
  'haskell-blaze-html<0.8' 'haskell-blaze-markup' 
  'haskell-bytestring' 'haskell-cmdargs' 'haskell-containers>=0.3'
  'haskell-directory' 'haskell-filepath' 'haskell-indents'
  'haskell-language-ecmascript<1' 'haskell-language-glsl>=0.0.2' 'haskell-mtl>=2' 'haskell-pandoc>=1.10'
  'haskell-parsec>=3.1.1' 'haskell-pretty' 'haskell-scientific' 'haskell-text'
  'haskell-transformers' 'haskell-union-find' 'haskell-unordered-containers' 'haskell-yaml')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('acd71e40c387682c6687bd9c205ea6b8')
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    # Public release must use `Simple` build, although a custom
    # `Setup.hs` is provided in the tarball.
    # This ugly hack makes this work.
    rm Setup.hs
    echo -e "import Distribution.Simple\nmain=defaultMain\n" > Setup.hs

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
