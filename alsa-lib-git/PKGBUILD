# Mantainer: Luca Bennati <lucak3 at gmail dot com>

pkgname=alsa-lib-git
pkgver=20101206
pkgrel=2
pkgdesc="An alternative implementation of Linux sound support - GIT version"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python')
makedepends=('python' 'git')
license=('GPL')
options=(!libtool)
conflicts=('alsa-lib')
provides=('alsa-lib')

_gitroot="git://git.alsa-project.org/alsa-lib.git"
_gitname="alsa-lib"

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

  libtoolize --force --copy --automake
  aclocal
  autoheader
  automake --foreign --copy --add-missing
  autoconf
  ./configure --prefix=/usr --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" --with-pythonincludes=-I/usr/include/python2.7
  make || return 1
  make DESTDIR=$pkgdir install
}
