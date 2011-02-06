# Contributor: Tristram Gräbener <tristramg at gmail dot com>

pkgname=osm4routing-git
pkgver=20091102
pkgrel=1
pkgdesc="OSM parser for routing. Produces csv files or postgis tables"
arch=('i686' 'x86_64')
url="http://github.com/Tristramg/osm4routing"
license=('GPL3')
depends=(boost postgresql-libs) 
makedepends=(gcc git)
source=()
md5sums=()

_gitroot="git://github.com/Tristramg/osm4routing.git"
_gitname="osm4routing"


build() {
  cd $startdir/src || return 1
  git clone $_gitroot || return 1

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname || return 1

  make || return 1
  mkdir -p $startdir/pkg/usr/bin || return 1
  cp osm4routing $startdir/pkg/usr/bin || return 1
}

