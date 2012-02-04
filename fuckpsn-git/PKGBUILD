# Contributor: Juan Diego Tascon

pkgname=fuckpsn-git
pkgver=20110310
pkgrel=1
pkgdesc="A simple SSL proxy used to spoof PSN version"
arch=(any)
url="http://gitorious.org/fuckpsn"
license=('GPL')
depends=("ruby-rubydns" "ruby-rainbow")
makedepends=("git")

_gitroot="git://gitorious.org/fuckpsn/fuckpsn.git"
_gitname="fuckpsn"

build() {
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
}

package() {
  mkdir -p "$pkgdir/opt/$_gitname"
  cp -rf "$srcdir/$_gitname-build/"* "$pkgdir/opt/$_gitname"
} 

