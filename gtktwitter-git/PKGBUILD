# Contributor: Rayslava <rayslava (at) gmail (dot) com>

pkgname=gtktwitter-git
pkgver=20090505
pkgrel=1
pkgdesc="A lightweight Twitter client for Linux written in GTK"
url="http://github.com/mattn/gtktwitter/tree/master"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'libxml2')
makedepends=('git')

_gitroot="http://github.com/mattn/gtktwitter.git"
_gitname="gtktwitter"

build() {
  cd $srcdir
  msg "Connecting to github.com GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
  	cd $_gitname && git pull origin
	msg "The local files are updated."
  else
	git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $srcdir/$_gitname $_gitname-build
  cd $_gitname-build

  ACLOCAL="aclocal" ./autogen.sh --host=${CHOST} || return 1
		    ./configure \
  				--prefix=/usr \
				--infodir=/usr/share/info \
				--mandir=/usr/man || return 1
		    make || return 1
		    make DESTDIR=$pkgdir install || return 1
}

