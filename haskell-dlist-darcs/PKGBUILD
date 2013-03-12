# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Don Stewart <dons@galois.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=haskell-dlist-darcs
_pkgname=haskell-dlist
pkgver=20130312
_hkgname=dlist
_licensefile=LICENSE
pkgrel=1
pkgdesc="Differences lists"
url="http://code.haskell.org/~dons/code/dlist/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=('ghc')
options=('strip')
install="${_pkgname}.install"

conflicts=(haskell-dlist)
provides=(haskell-dlist)

_darcstrunk=http://code.haskell.org/~dons/code/
_darcsmod=dlist

build() {
  cd "$srcdir"
  msg "Checking for previous build...."

  if [[ -d "$_darcsmod/_darcs" ]]; then
    msg "Retrieving missing patches"
    cd "$_darcsmod"
    darcs pull -a "$_darcstrunk/$_darcsmod"
  else
    msg "Retrieving complete sources"
    darcs get --set-scripts-executable "$_darcstrunk/$_darcsmod"
    cd "$_darcsmod"
  fi

  rm -rf "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"
  cd "$srcdir/$_darcsmod-build"

  msg "Starting build..."
    
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
  cd "$srcdir/$_darcsmod-build"
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
