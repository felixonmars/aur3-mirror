# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
# Contributor: Lex Black <autumn-wind at web dot de>

_hkgname=todos
pkgname=todos
pkgver=0.5.3.1
pkgrel=2
pkgdesc="Easy-to-use TODOs manager."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('haskell-ansi-terminal'
	'haskell-base-unicode-symbols'
	'haskell-containers'
	'haskell-data-hash'
	'haskell-dates0.1.2'
	'haskell-directory'
	'haskell-dyre'
	'haskell-filepath'
	'haskell-glob'
	'haskell-mtl'
	'haskell-parsec'
	'haskell-process'
	'haskell-regex-pcre'
	'haskell-syb'
	'haskell-time'
	'haskell-utf8-string') # haskell-dates<0.2
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('7121c9a38a5e2769e55dd566851e84ff')
install=${pkgname}.install

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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
