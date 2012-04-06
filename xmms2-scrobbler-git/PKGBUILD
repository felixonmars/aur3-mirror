# Contributor: palbo <quuxbaz@gmail.com>

pkgname=xmms2-scrobbler-git
pkgver=20120406
pkgrel=1
pkgdesc="Audioscrobbler client for XMMS2"
arch=(i686 x86_64)
url="http://code-monkey.de/pages/xmms2-scrobbler"
license=('MIT')
depends=('curl')
install=xmms2-scrobbler-git.install
conflicts=('xmms2-scrobbler')
provides=('xmms2-scrobbler')
source=()
md5sums=()

_gitroot="git://git.xmms.se/xmms2/xmms2-scrobbler.git"
_gitname="xmms2-scrobbler"

build() {
  if [ -d $srcdir/$_gitname ] ; then
    cd $srcdir/$_gitname && git pull origin
  else
    git clone $_gitroot
    cd $srcdir/$_gitname
  fi

  git checkout -f

  cd $srcdir
  cp -r $_gitname $_gitname-build
  cd $srcdir/$_gitname-build

  make LDFLAGS="-lrt -lpthread" PREFIX=/usr || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/xmms2-scrobbler/COPYING

  rm -r $srcdir/$_gitname-build
}
