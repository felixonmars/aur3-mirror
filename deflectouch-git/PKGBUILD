# Maintainer: Padfoot <padfoot at exemail dot com dot au>

pkgname=deflectouch-git
pkgver=20120717
pkgrel=1
pkgdesc="Multitouch game using the kivy toolkit"
arch=('any')
url="https://github.com/stocyr/Deflectouch/"
license=('GPL3')
depends=('kivy')
makedepends=('git')
source=('Deflectouch.desktop')
md5sums=('aa0c06b90b513fc5de9aef62fe56854a')

_gitroot='https://github.com/stocyr/Deflectouch'
_gitname='Deflectouch'

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
  rm "$srcdir/$_gitname-build/.gitignore"
}

package() {
  mkdir -p \
    "$pkgdir/usr/share/games/$_gitname" \
    "$pkgdir/usr/share/applications" || return 1

  cp -r $srcdir/$_gitname-build/* $pkgdir/usr/share/games/$_gitname
  cp $srcdir/$_gitname.desktop $pkgdir/usr/share/applications
}
