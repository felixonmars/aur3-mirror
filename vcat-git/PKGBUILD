# Maintainer: Clément Guérin <geecko.dev@free.fr>
pkgname=vcat-git
pkgver=20120504
pkgrel=1
pkgdesc="vcat (video cat) outputs a video on a 256-color enabled terminal with UTF-8 locale."
arch=('i686' 'x86_64')
url="https://github.com/GeeckoDev/vcat"
license=('BSD')
depends=('ffmpeg')
makedepends=('git')
provides=('vcat')

_gitroot="git://github.com/GeeckoDev/vcat.git"
_gitname="vcat"

build() {
  cd "$srcdir"
  msg "Connecting to Git server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  msg "Compiling..."

  cd "$srcdir/$_gitname"
  make clean
  make
}

package() {
  cd "$srcdir"

  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp "$srcdir/$_gitname/vcat" "$pkgdir/usr/bin"
}
