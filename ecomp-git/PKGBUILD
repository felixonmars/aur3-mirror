# Old Contributor: Michele Gastaldo <pikiweb@gmail.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ecomp-git
pkgver=20110425
pkgrel=3
pkgdesc="OpenGL compositing manager based on compiz"
arch=('i686' 'x86_64')
url="http://code.google.com/p/itask-module/wiki/Stuff"
license=('MIT')
depends=('libxslt' 'mesa' 'e-svn' 'mesa-demos')
makedepends=('intltool' 'git' 'automake' 'pkgconfig')
provides=('ecomp')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://github.com/jeffdameth/ecomp"
_gitname="ecomp"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cd $srcdir/$_gitname
  LDFLAGS="-Wl,--hash-style=gnu"
  ./autogen.sh --prefix=/opt/ecomorph
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  
  mkdir -p "$pkgdir"/usr/bin
  ln -s /opt/ecomorph/bin/ecomorph "$pkgdir"/usr/bin/ecomorph

  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
