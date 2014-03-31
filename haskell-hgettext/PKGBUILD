# Maintainer: Alex Merry <dev@randomguy3.me.uk>
# custom variables
_hkgname=hgettext
_licensefile=license.txt

pkgname=haskell-hgettext
pkgver=0.1.30
pkgrel=1
pkgdesc="A simple wrapper to libintl and gettext to provide localization in Haskell applications"
arch=(i686 x86_64)
url="https://github.com/vasylp/hgettext"
license=('BSD3')
depends=('ghc'
         'haskell-base<5'
         'haskell-cabal>=1.10'
         'haskell-containers'
         'haskell-directory'
         'haskell-filepath'
         'haskell-haskell-src-exts'
         'haskell-process'
         'haskell-setlocale'
         'haskell-uniplate')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
md5sums=('6b36a5c86e13de18c7daef124d9e9a71')

build() {
    cd "$srcdir/$_hkgname-$pkgver"

    runhaskell Setup configure -O --enable-split-objs --enable-shared \
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

    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
}

# vim:set ts=2 sw=2 et:
