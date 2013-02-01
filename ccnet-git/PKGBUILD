# Maintainer: Alf <naihe2010@126.com>

pkgname=ccnet-git
pkgver=20130201
pkgrel=1
pkgdesc='A framework for writing networked applications in C.'
arch=('i686' 'x86_64')
url='https://github.com/haiwen/ccnet'
license=('GPLv3')
depends=('libsearpc-git')
makedepends=('vala')
options=()
_gitroot='git://github.com/haiwen/ccnet.git'
_gitname='ccnet'
md5sums=()

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
    cd $_gitname
  fi

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i 's/(DESTDIR)//' libccnet.pc.in

  ./autogen.sh
  ./configure --prefix=/usr PYTHON=/usr/bin/python2
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  make clean
}
