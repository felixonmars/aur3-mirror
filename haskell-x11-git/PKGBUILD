# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Adam Vogt <vogt.adam@gmail.com>
# Contributor: aeolist <aeolist@hotmail.com>
pkgname=haskell-x11-git
pkgver=20130312
pkgrel=1
pkgdesc="A Haskell binding to the X11 graphics library."
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/X11"
license=('BSD3')
depends=('haskell-data-default')
makedepends=('git' 'ghc' 'autoconf' 'automake')
provides=('haskell-x11')
conflicts=('haskell-x11')
install=hsmod.install

_gitroot=git://github.com/haskell-pkg-janitors/X11.git
_gitname=X11

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
  msg "Starting build"

  autoreconf

  runhaskell Setup configure --prefix=/usr
  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
}
package() {
  cd "$srcdir/$_gitname-build"

  install -D -m744 register.sh $pkgdir/usr/share/haskell/$pkgname/register.sh
  install -m744 unregister.sh $pkgdir/usr/share/haskell/$pkgname/unregister.sh

  runhaskell Setup copy --destdir=$pkgdir
 
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/BSD3
}
# vim:set ts=2 sw=2 et:
