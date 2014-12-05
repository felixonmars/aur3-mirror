# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=yi
pkgname=yi
pkgver=0.11.1
pkgrel=1
pkgdesc="The Haskell-Scriptable Editor"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=()
depends=('gmp'
         'ghc'
         'haskell-array'
         'haskell-binary>=0.5'
         'haskell-bytestring'
         'haskell-cautious-file>=1.0.1'
         'haskell-containers'
         'haskell-data-default'
         'haskell-directory'
         'haskell-dlist>=0.4.1'
         'haskell-dynamic-state>=0.1.0.5'
         'haskell-dyre>=0.8.11'
         'haskell-exceptions'
         'haskell-filepath'
         'haskell-hashable>=1.1.2.5'
         'haskell-hint>0.3.1'
         'haskell-lens>=4.4.0.1'
         'haskell-mtl'
         'haskell-old-locale'
         'haskell-oo-prototypes'
         'haskell-parsec'
         'haskell-pointedlist>=0.5'
         'haskell-process'
         'haskell-regex-base'
         'haskell-regex-tdfa<1.3'
         'haskell-safe<0.4'
         'haskell-semigroups'
         'haskell-split<0.3'
         'haskell-tagged'
         'haskell-template-haskell'
         'haskell-text'
         'haskell-time'
         'haskell-transformers-base'
         'haskell-unix-compat<0.5'
         'haskell-unordered-containers<0.3'
         'haskell-utf8-string>=0.3.1'
         'haskell-word-trie>=0.2.0.4'
         'haskell-xdg-basedir<0.3'
         'haskell-vty'
         'haskell-yi-language>=0.1.0.7'
         'haskell-yi-rope<0.8')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('f3510fad4d23d6a78aa2b6f5a61f237f')
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid -fvty
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
}
