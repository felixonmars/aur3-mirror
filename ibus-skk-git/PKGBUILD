pkgname=ibus-skk-git
pkgver=20101218
pkgrel=1
pkgdesc='Japanese input method SKK engine for IBus'
arch=('i686' 'x86_64')
url='https://github.com/ueno/ibus-skk'
license=('GPL')
depends=('ibus')
makedepends=('git' 'gnome-common')
conflicts=('ibus-skk')
provides=('ibus-skk')

_gitroot='git://github.com/ueno/ibus-skk.git'
_gitname='ibus-skk'

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server....'

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  NOCONFIGURE=1 ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
