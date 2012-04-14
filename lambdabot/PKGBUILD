# Maintainer: lilydjwg <lilydjwg@gmail.com>
_hkgname=lambdabot
pkgname=lambdabot
pkgver=4.2.3.2
pkgrel=1
pkgdesc="Lambdabot is a development tool and advanced IRC bot"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-http>=4000.1.1' 'haskell-iospec' 'haskell-monadrandom' 'haskell-arrows' 'haskell-binary>0.2' 'haskell-brainfuck' 'haskell-data-memocombinators' 'haskell-haskell-src>=1.0.1.4' 'haskell-haskell-src-exts>=0.4.8' 'haskell-lambdabot-utils' 'haskell-logict>=0.4.2' 'haskell-mtl=2.0.1.0' 'haskell-network>=2.3.0.2' 'haskell-numbers' 'haskell-oeis>=0.2' 'haskell-parsec>=3.1.1' 'haskell-random>=1.0.0.3' 'haskell-readline' 'haskell-regex-compat>=0.93.1' 'haskell-show>=0.3' 'haskell-tagsoup' 'haskell-unlambda' 'haskell-utf8-string' 'haskell-vector-space')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('a55a0ca124a96faed337be665aaad097')
build() {
    #NOTE: if error with -lncursesw not found, edit readline's config, i.e. /usr/lib/ghc-7.4.1/package.conf.d/readline-*.conf
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    msg2 "Patching..."
    sed -i 's=TypeSynonymInstances=&, FlexibleInstances=' \
	Plugin/{Activity,Base,Djinn,Fact,Haddock,Hoogle,Localtime,More,Pl,Poll,Quote,Source,State,Tell,Todo,Where,Karma}.hs
    runhaskell Setup build
    runhaskell Setup haddock
    # runhaskell Setup register   --gen-script
    # Package contains no library to register
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    # install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install -D -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
}
