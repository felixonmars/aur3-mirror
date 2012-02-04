# Maintainer: <grawity@gmail.com>
pkgname=lsh-cvs
pkgver=20110712
pkgrel=3
pkgdesc="SSH client/server"
arch=('i686' 'x86_64')
url="http://www.lysator.liu.se/~nisse/"
license=('GPL')
depends=('liboop' 'libxau' 'nettle')
makedepends=('cvs' 'gperf' 'guile'
  # for documentation
  'ghostscript' 'texinfo' 'texlive-core')

_cvsroot=":pserver:anonymous@cvs.lysator.liu.se:/cvsroot/lsh"
_cvsmod="lsh"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  msg "Starting build process"

  ./.bootstrap
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/lsh \
    --localstatedir=/var \
    --with-system-nettle \
    --with-include-path="$PWD" \
    --with-lib-path="$PWD/argp:$PWD/spki"
  make bootstrap
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
}
# vi: ft=sh:ts=2:sw=2:et
