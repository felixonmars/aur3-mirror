# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=bognor-regis-git
pkgver=20110218
pkgrel=1
pkgdesc="Media daemon and play queue manager"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('gconf' 'libnotify' 'gupnp-av' 'tracker>=0.10')
makedepends=('git' 'intltool')
provides=('bognor-regis')
conflicts=('bognor-regis')
options=('!libtool')
source=('tracker0.10.patch')
md5sums=('a6051a04128eaf141e6205285f2a7b68')

_gitroot="git://gitorious.org/meego-netbook-ux/bognor-regis.git"
_gitname="bognor-regis"

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

  patch -Np0 -i ${srcdir}/tracker0.10.patch

  ./autogen.sh
  ./configure --prefix=/usr \
    --libexec=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
