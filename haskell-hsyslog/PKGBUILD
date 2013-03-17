# Maintainer: Vladimir Still <vl.still@gmail.com>
# custom variables
_hkgname=hsyslog
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-hsyslog
pkgver=1.5
pkgrel=1
pkgdesc="FFI interface to syslog(3) from POSIX.1-2001."
url="http://gitorious.org/hsyslog"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc" "sh")
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
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
sha512sums=('2330a8b06be89d7fef763846c22d59dcadcf9625610e039ba3f4c0331a40548df34588bd0a3eef0d4f3d60f2c36b8e1f1b392d57862694d6fab7a234c87d1141')
