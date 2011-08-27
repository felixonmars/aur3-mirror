# Contributor: Chris Brannon <cmbrannon@cox.net>
pkgname=dotconf-git
pkgver=20100415
pkgrel=1
pkgdesc='A C library for parsing configuration files'
arch=('i686' 'x86_64')
license=('LGPL2')
makedepends=('git' 'pkgconfig' 'findutils')
options=('!libtool')
url="http://opentts.org/projects/dotconf"
provides=(dotconf)
conflicts=(dotconf)

_gitroot="git://git.opentts.org/dotconf.git"
_gitname="dotconf"

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

  autoreconf -i || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
  # There are no manpages.  Docu consists of textfiles and small examples.
  # "make install" didn't install the docu, so do it manually.
  mkdir -p "${pkgdir}/usr/share/doc/dotconf" || return 1
  cp -a doc/*.txt README examples/ "${pkgdir}/usr/share/doc/dotconf" || return 1
} 
