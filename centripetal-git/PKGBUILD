# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname=centripetal-git
pkgver=20120725
pkgrel=1
pkgdesc="Multitouch breakout game"
arch=('any')
url="https://github.com/dcower/Centripetal"
license=('MIT')
depends=('kivy')
makedepends=('git')
source=('Centripetal.desktop')
md5sums=('6c6b7928af46dced206024c8c2e846f1')

_gitroot='https://github.com/dcower/Centripetal'
_gitname='Centripetal'

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
  rm -rf "$srcdir/$_gitname-build/.git"
}

package() {
  mkdir -p \
    "$pkgdir/usr/share/games/$_gitname" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/licenses/$_gitname" || return 1

  cd "$srcdir/$_gitname-build"
  
  install -D -m644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$_gitname"
  
  cp -r $srcdir/$_gitname-build/* $pkgdir/usr/share/games/$_gitname
  cp $srcdir/$_gitname.desktop $pkgdir/usr/share/applications
}
