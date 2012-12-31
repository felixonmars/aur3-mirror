# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=python-osmgpsmap-git
pkgver=20121231
pkgrel=2
pkgdesc="Python bindings for osm-gps-map"
arch=('i686' 'x86_64')
url="http://nzjrs.github.com/osm-gps-map/"
license=('GPL')
depends=('python2' 'pygobject' 'pygtk' 'osm-gps-map-git')
provides=('python-osmgpsmap')
source=()
md5sums=()

_gitroot="git://github.com/nzjrs/osm-gps-map.git"
_gitname="osm-gps-map"

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
	cd "$srcdir/$_gitname/python"
  # fix for py2k
  find -name "*.py" | xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
	msg "Starting make..."
  autoreconf --force --install
  # I hate automake
  sed -i "s|python python2|python2|" configure
  ./configure --prefix=/usr
  make
}

package() {
	cd "$srcdir/$_gitname/python"
	make DESTDIR=$pkgdir install
}
