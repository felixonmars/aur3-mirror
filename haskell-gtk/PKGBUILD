# custom variables
_hkgname=gtk
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-gtk
pkgver=0.12.1
pkgrel=1
pkgdesc="Binding to the Gtk+ graphical user interface library."
url="http://projects.haskell.org/gtk2hs/"
license=("LGPL-2.1")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-array=0.3.0.2"
         "haskell-bytestring=0.9.1.10"
         "haskell-cairo=0.12.1"
         "haskell-containers=0.4.0.0"
         "haskell-gio=0.12.1"
         "haskell-glib=0.12.1"
         "haskell-mtl=2.0.1.0"
         "haskell-pango=0.12.1"
         "glib"
         "gtk2"
         "gtk2hs-buildtools")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("5b27295a98f07eb0e5963bfafb81bd38de87e1795d7a44d0886e45e15ceffc00")

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
