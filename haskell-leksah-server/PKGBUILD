# Maintainer: Martin Harvan <martinhrvn@gmail.com>
_hkgname=leksah-server
pkgname=haskell-leksah-server
pkgver=0.12.1.2
pkgrel=1
pkgdesc="Metadata collection for leksah"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 
    'haskell-cabal>=1.6.0.1' 'haskell-cabal<1.15'
    'haskell-attoparsec<0.11' 'haskell-attoparsec>=0.10.0.3'
    'haskell-attoparsec-enumerator<0.4'
    'haskell-binary<0.6' 'haskell-binary>=0.5'
    'haskell-binary-shared<0.9' 'haskell-binary-shared>=0.8'
    'haskell-bytestring>=0.9.0.1' 'haskell-bytestring<0.10' 
    'haskell-containers>=0.2' 'haskell-containers<0.5'
    'haskell-deepseq>=1.1' 'haskell-deepseq<1.4'
    'haskell-directory>=1.0.0.2' 'haskell-directory<1.2' 
    'haskell-enumerator<0.5' 'haskell-enumerator>=0.4.14'
    'haskell-filepath>=1.1.0.1' 'haskell-filepath<1.4'
    'haddock>=2.7.2' 'haddock<2.11'
    'haskell-hslogger>=1.0.7' 'haskell-hslogger<1.2' 
    'haskell-ltk>=0.12.1' 'haskell-ltk<0.13' 
    'haskell-network>=2.2' 'haskell-network<3.0' 
    'haskell-parsec>=2.1.0.1' 'haskell-parsec<3.2'
    'haskell-pretty>=1.0.1.0' 'haskell-pretty<1.2'
    'haskell-process>=1.1' 'haskell-process<1.2'
    'haskell-strict>=0.3.2' 'haskell-strict<0.4'
    'haskell-time>=1.1' 'haskell-time<1.5'
    'haskell-transformers>=0.2.2.0' 'haskell-transformers<0.4'
    'haskell-unix>=2.3.1.0' 'haskell-unix<2.6')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('7b7838177f3c60e1a15c6451a69b935a')
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
}
