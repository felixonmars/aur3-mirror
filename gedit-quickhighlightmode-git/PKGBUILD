# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gedit-quickhighlightmode-git
pkgver=20100917
pkgrel=1
pkgdesc="Provides a faster and easier way to select the current document highlighting mode"
arch=('any')
url="http://github.com/nagaozen/gedit-plugin-quickhighlightmode/"
license=('GPL')
depends=('gedit')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/nagaozen/gedit-plugin-quickhighlightmode.git"
_gitname="gedit-quickhighlightmode"

build() {
  true
}

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -d "$pkgdir/usr/lib/gedit-2/plugins/quickhighlightmode"
  install -m644 -t "$pkgdir/usr/lib/gedit-2/plugins/quickhighlightmode/" \
    quickhighlightmode/*
  install -m644 quickhighlightmode.gedit-plugin \
    "$pkgdir/usr/lib/gedit-2/plugins/"
} 
