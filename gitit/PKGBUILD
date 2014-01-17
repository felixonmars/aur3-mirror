# Maintainer: Joop Kiefte <ikojba@gmail.com>
_hkgname=gitit
pkgname=gitit
pkgver=0.10.3.1
pkgrel=1
pkgdesc="Wiki using happstack, git or darcs, and pandoc."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('gmp' 'ghc' 'haskell-configfile<1.2' 'haskell-hstringtemplate<0.8' 'haskell-http=4000.1.1' 'haskell-sha<1.7' 'haskell-base64-bytestring<1.1' 'haskell-blaze-html<0.7' 'haskell-bytestring=0.9.1.10' 'haskell-cgi=3001.1.7.4' 'haskell-containers=0.4.0.0' 'haskell-directory=1.1.0.0' 'haskell-feed<0.4' 'haskell-filepath=1.2.0.0' 'haskell-filestore<0.7' 'haskell-ghc-paths' 'haskell-happstack-server<7.2' 'haskell-highlighting-kate<0.6' 'haskell-hslogger<1.3' 'haskell-json<0.8' 'haskell-mtl=2.0.1.0' 'haskell-network=2.3.0.2' 'haskell-old-locale=1.0.0.2' 'haskell-old-time=1.0.0.6' 'haskell-pandoc<1.12' 'haskell-pandoc-types<1.11' 'haskell-parsec=3.1.1' 'haskell-pretty=1.0.1.2' 'haskell-process=1.0.1.5' 'haskell-random=1.0.0.3' 'haskell-recaptcha>=0.1' 'haskell-safe' 'haskell-syb=0.3' 'haskell-tagsoup<0.13' 'haskell-text=0.11.0.5' 'haskell-time=1.2.0.3' 'haskell-url<2.2' 'haskell-utf8-string<0.4' 'haskell-xhtml=3000.2.0.1' 'haskell-xml>=1.3.5' 'haskell-xss-sanitize<0.4' 'haskell-zlib=0.5.3.1')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('2b3fe00d34a40dfad4313ac546d8c70a')
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
