_hkgname=dbus-core
pkgname=haskell-dbus-core
pkgver=0.9.2.1
pkgrel=1
pkgdesc="Low-level D-Bus protocol implementation"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL-3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
         'haskell-binary<0.6'
         'haskell-bytestring<0.10'
         'haskell-containers<0.5'
         'haskell-data-binary-ieee754<0.5'
         'haskell-libxml-sax<0.8'
         'haskell-network<2.4'
         'haskell-parsec<3.2'
         'haskell-text>=0.11.1.5'
         'haskell-unix<2.6'
         'haskell-vector<0.10'
         'haskell-xml-types<0.4')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('270e27a59ba8a8530000c24415a9c7ad')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
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
}

# vim:set ts=2 sw=2 et:
