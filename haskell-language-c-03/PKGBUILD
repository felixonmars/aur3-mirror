#OldMaintainer: bjoern lindig <bjoern dot lindig at googlemail dot com>
#Maintainer: Filip Brcic <brcha@gna.org>
# custom variables
_hkgname=language-c
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-language-c-03
pkgver=0.3.2.1
pkgrel=4
pkgdesc="Analysis and generation of C code"
url="http://www.sivity.net/projects/language.c/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=( 
	 "ghc"
         "sh"
         "happy"
         "alex"
         "haskell-syb"
	 "haskell-array"
	 "haskell-containers"
	 "haskell-directory"
	 "haskell-filepath"
	 "haskell-pretty"
	 "haskell-process"
	 )
provides=("haskell-language-c=${pkgver}")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
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
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}-03
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
md5sums=('a6722643c8416e3baa9ebeca94c6f631')
