# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Don Stewart <dons@galois.com>

pkgname=haskell-data-default-git
_pkgname=haskell-data-default
_hkgname=data-default
_licensefile=LICENSE
pkgver=20130312
pkgrel=1
pkgdesc="A class for types with a default value"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('ghc' 'git')
depends=('haskell-containers' 'haskell-dlist' 'haskell-old-locale')
options=('strip')
install="${_pkgname}.install"
conflicts=('haskell-data-default')
provides=('haskell-data-default')

_gitroot=git://github.com/mauke/data-default.git
_gitname=$_pkgname


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
      --prefix=/usr --docdir=/usr/share/doc/${_pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    #runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
    #    --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
    #    --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$_gitname-build"
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${_pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${_pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${_pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${_pkgname}/LICENSE
}
