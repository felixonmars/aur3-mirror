# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_hkgname=libmpd
pkgname=haskell-libmpd-git
pkgver=20121012
pkgrel=1
pkgdesc="An MPD client library, git version."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
    'haskell-attoparsec<0.11'
    'haskell-bytestring=0.10.0.0'
    'haskell-containers=0.5.0.0'
    'haskell-data-default<0.6'
    'haskell-filepath=1.3.0.1'
    'haskell-mtl<2.2'
    'haskell-network<2.4'
    'haskell-old-locale=1.0.0.5'
    'haskell-text<0.12'
    'haskell-time=1.4.0.1'
    'haskell-utf8-string<0.4'
)
conflicts=('haskell-libmpd')
provides=('haskell-libmpd=0.9.0')
options=('strip')
install=${pkgname}.install

_gitroot="https://github.com/joachifm/libmpd-haskell.git"
_gitname="libmpd-haskell"
_archname="haskell-libmpd"

build() {
    cd ${srcdir}/
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin 
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname -b trunk
    fi  

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd "$srcdir/$_gitname-build"
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${_archname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${_archname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${_archname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
}
