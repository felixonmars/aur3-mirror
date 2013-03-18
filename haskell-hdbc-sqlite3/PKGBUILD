# Maintainer: Joshua Hunt <snark1994@gmail.com>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
pkgname=haskell-hdbc-sqlite3
pkgver=2.3.3.0
pkgrel=1
pkgdesc="Sqlite v3 driver for HDBC"
url="http://hackage.haskell.org/package/HDBC-sqlite3"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('haskell-base>=4' 'haskell-base<5' 'haskell-bytestring' 'haskell-hdbc>=2.3.0.0' 'haskell-mtl' 'haskell-utf8-string' 'sqlite3')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/HDBC-sqlite3/${pkgver}/HDBC-sqlite3-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('0aa68f0704aa96953d2568fd787d6cbd')

build() {
    cd ${srcdir}/HDBC-sqlite3-${pkgver}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/HDBC-sqlite3-${pkgver}
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # Added
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/HDBC-sqlite3
    runhaskell Setup copy --destdir=${pkgdir}
}
