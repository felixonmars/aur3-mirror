# Maintainer: Aapo Vienamo <aapo.vienamo@iki.fi>
pkgname=curcon-git
pkgver=20130113
pkgrel=1
pkgdesc="Curcon is a simple command line currency converter."
url="https://github.com/tkln/curcon"
arch=('any')
license=('custom:WTFPL')
depends=('python')
makedepends=('git' 'python')

_gitroot=https://github.com/tkln/curcon.git
_gitname=curcon

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

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  install -m 0775 curcon.py $pkgdir/usr/bin/curcon
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
