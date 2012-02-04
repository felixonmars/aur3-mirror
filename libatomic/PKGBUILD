# Contributor: Andrej Nandaromovszij <sorosj@gmail.com>

pkgname=libatomic
pkgrel=1
pkgver=99
pkgdesc="Libatomic provides arch-independant API for the low-level atomic implementation."
arch=('i686')
url="http://ioremap.net"
license=('GPL')
makedepends=('make' 'gcc' 'git' 'autoconf' 'automake')


_gitroot=http://www.ioremap.net/git/libatomic.git
_gitrepo=libatomic.ġit

build() {
  msg "Cloning the repo..."
  cd $startdir/src
  if [ ! -d $_gitrepo ]; then
    git clone $_gitroot $_gitrepo
  else
    cd $_gitrepo
    git pull
    cd ..
  fi

  msg "Done, now exporting a pristine version of the repo to work in..."
  cd $_gitrepo
  git archive --format=tar --prefix=$pkgname/ HEAD | (cd $startdir/src/ && tar xf -)
  cd ../$pkgname

  msg "Done, building libatomic..."
  ./autogen.sh
  ./configure --prefix=/usr
  make DESTDIR="$startdir/pkg/"
  make DESTDIR="$startdir/pkg/" install
  
  msg "Done, thanks!"
}

