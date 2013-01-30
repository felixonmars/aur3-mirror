_gitroot="git://github.com/opdenkamp/xbmc-pvr-addons.git"
_gitname="xbmc-pvr-addons"
_gitbranch='frodo'

pkgname=xbmc-pvr-addons
pkgver=20130130
pkgrel=1
pkgdesc="XBMC PVR add-ons for current stable xbmc"
arch=('i686' 'x86_64')
url="https://github.com/opdenkamp/xbmc-pvr-addons"
license=('GPL3')
depends=('xbmc' 'libmysqlclient')
makedepends=('git' 'libmysqlclient' 'boost')
optdepends=('tvheadend-git: tvheadend backend' 'mythtv: mythtv backend')
provides=('xbmc-pvr-addons')
conflicts=('xbmc-pvr-addons-git')

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone -b $_gitbranch $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  msg "Starting bootstrap..."
  ./bootstrap
  
  msg "Starting configure..."
  ./configure --prefix=/usr --enable-addons-with-dependencies
  
  msg "Starting make install..."
  make DESTDIR="$pkgdir/" install
}
