# Maintainer: TDY <tdy@gmx.com>

pkgname=beaver-git
pkgver=20121227
pkgrel=1
pkgdesc="A lightweight, modular, and stylish editor"
arch=('i686' 'x86_64')
url="http://beaver-editor.sourceforge.net/"
license=('GPL')
depends=('gtk2>=2.10.0' 'hicolor-icon-theme')
makedepends=('git' 'intltool>=0.40.0' 'pkgconfig>=0.9.0')
provides=('beaver')
conflicts=('beaver')
options=('!libtool')
install=beaver.install

_gitroot=git://beaver-editor.git.sourceforge.net/gitroot/beaver-editor
_gitname=beaver-editor

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg2 "Local files updated"
  else
    git clone $_gitroot/$_gitname
    msg2 "GIT checkout done"
  fi

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting make..."
  ./autogen.sh && ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make prefix="$pkgdir/usr" install
}
