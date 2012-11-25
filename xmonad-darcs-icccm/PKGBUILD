# Maintainer: Valentin-Costel Haloiu <vially.ichb+aur@gmail.com>

_hkgname=xmonad
pkgname=xmonad-darcs-icccm
pkgver=20121116
pkgrel=2
pkgdesc="A tiling window manager - with ICCCM patch"

url="http://xmonad.org"
license=('custom:BSD3')
arch=('i686' 'x86_64')
conflicts=('xmonad')
depends=('gmp' 'libxinerama' 'ghc' 'haskell-extensible-exceptions' 'haskell-mtl' 'haskell-utf8-string' 'haskell-x11>=1.6')
optdepends=('xorg-message: for displaying visual error messages')
makedepends=('darcs')
options=('strip')
source=(xmonad.svg track-currently-processing-event.dpatch)
install=${_hkgname}.install
md5sums=('72bfa5e62e4e44fe7fa59b6a7593d993' '6a7a41256637a8ce6b4428c9a2c663c0')
_darcstrunk="http://code.haskell.org"
_darcsmod="xmonad"

build() {
    cd ${srcdir}

    if [[ -d ${srcdir}/$_darcsmod/_darcs ]]
    then
      msg "Retrieving missing patches"
      cd $_darcsmod
      darcs pull -a $_darcstrunk/$_darcsmod
    else
      msg "Retrieving complete sources"
      darcs get --lazy --set-scripts-executable $_darcstrunk/$_darcsmod
    fi
    cd ${srcdir}/$_darcsmod
    darcs apply ${srcdir}/track-currently-processing-event.dpatch # This patch was already merged upstream therefore this package is mostly useless now

    runhaskell Setup configure --ghc --enable-shared --enable-split-objs --prefix=/usr \
                --docdir=/usr/share/doc/${_hkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/$_darcsmod
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${_hkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${_hkgname}/unregister.sh
    runhaskell Setup copy --destdir=${pkgdir}

    install -D -m644 man/xmonad.1 $pkgdir/usr/share/man/man1/xmonad.1
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_hkgname}/LICENSE
    install -D -m644 $srcdir/xmonad.svg $pkgdir/usr/share/pixmaps/xmonad.svg
    rm -f ${pkgdir}/usr/share/doc/${_hkgname}/LICENSE
}
