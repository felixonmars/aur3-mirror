# Maintainer: Carlos Ruiz-Henestrosa <ruizh.cj+aur@gmail.com>
_hkgname=base-unicode-symbols
pkgname=haskell-${_hkgname}-git
pkgver=20120706
pkgrel=1
pkgdesc="Unicode alternatives for common functions and operators"
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/package/$_hkgname"
license=('custom:BSD3')
depends=('ghc')
provides=("haskell-${_hkname}")
conflicts=("haskell-${_hkname}")
install=$pkgname.install

_gitroot=git://github.com/roelvandijk/base-unicode-symbols.git
_gitname=$_hkgname

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

  #
  # BUILD HERE
  #

	runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
		--prefix=/usr --docdir="/usr/share/doc/$pkgname" \
		--libsubdir=\$compiler/site-local/\$pkgid
	runhaskell Setup build
	runhaskell Setup haddock
	runhaskell Setup register   --gen-script
	runhaskell Setup unregister --gen-script
	sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$_gitname-build"

	install -D -m744 register.sh   "$pkgdir/usr/share/haskell/$pkgname/register.sh"
	install	   -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
	install -d -m755 "$pkgdir/usr/share/doc/ghc/html/libraries"
	ln -s "/usr/share/doc/$pkgname/html" "$pkgdir/usr/share/doc/ghc/html/libraries/$_hkgname"
	runhaskell Setup copy --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
