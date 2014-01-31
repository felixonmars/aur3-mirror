# Contributor: Patrick Hanckmann <hanckmann at gmail.com>
# Maintainer: Patrick Hanckmann <hanckmann at gmail.com>
pkgname=gsl-git
pkgver=20140101
pkgrel=1
pkgdesc="GSL/4.1 - a Universal Code Generator"
arch=(i686 x86_64)
url="https://github.com/imatix/gsl"
license=('GPL3')
makedepends=('git')
provides=(gsl-code-generator)
conflicts=(gsl-code-generator)

_gitroot="git@github.com:imatix/gsl.git"
_gitname="gsl"

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
  cd "$srcdir/$_gitname-build/src"

  #
  # BUILD HERE
  #
  make
} 

package() {
  cd "$srcdir/$_gitname-build/src"
  make DESTDIR="$pkgdir/" install
  
  mv $pkgdir/usr/local/bin/gsl $pkgdir/usr/local/bin/gsl-code-generator
  msg "Executable renamed to gsl-code-generator to avoid a conflict with the gsl library"
  #$pkgdir/usr/local/bin/gsl-code-generator -v
} 

