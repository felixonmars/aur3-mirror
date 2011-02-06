# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=massifg-git
pkgver=20100816
pkgrel=1
pkgdesc="GTK based visualizer for massif - git version"
arch=(i686 x86_64)
url="http://www.gitorious.org/massifg"
license=('GPLv3')
depends=('gtk2' 'goffice')
makedepends=('git')
provides=(massifg)
conflicts=(massifg)
install=

_gitroot="git://gitorious.org/massifg/massifg.git"
_gitname="massifg"

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

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
