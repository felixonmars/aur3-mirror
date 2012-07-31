# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
_hkgname=hostname

pkgname=haskell-hostname
pkgver=1.0
pkgrel=19
pkgdesc="A very simple package providing a cross-platform means of determining the hostname"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
depends=("ghc")
options=('strip')

source=("http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz" "$pkgname.install" Changelog)
sha256sums=('9b43dab1b6da521f35685b20555da00738c8e136eb972458c786242406a9cf5c'
            '4e720e7475db22751c4d38b5f2befeb23cab7a54227ef2f7d8b0ce375d265990'
            '94e954bf32c5328ac0288383470eac67609342d9016372fcc7e55f1dddd57c8e')
install="${pkgname}.install"

# PKGBUILD functions
build() {
    cd "${srcdir}/$_hkgname-${pkgver}"
    
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
    cd "$srcdir/$_hkgname-$pkgver"
    install -D -m744 register.sh   "$pkgdir/usr/share/haskell/$pkgname/register.sh"
    install    -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/$_hkgname"
    runhaskell Setup copy --destdir="$pkgdir"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
