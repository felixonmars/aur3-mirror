# Old Contributor: Michele Gastaldo <pikiweb@gmail.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ecomorph-git
pkgver=20110425
pkgrel=2
pkgdesc="A compositing manager for E17"
arch=('i686' 'x86_64')
url="http://code.google.com/p/itask-module/wiki/Stuff"
license=('custom')
depends=('ecomp-git')
makedepends=('intltool' 'git' 'automake' 'pkgconfig')
conflicts=('ecomorph')
provides=('ecomorph')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://github.com/jeffdameth/ecomorph.git"
_gitname="ecomorph"

build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cd $srcdir/$_gitname
  ./autogen.sh --prefix=/opt/ecomorph
  LDFLAGS="-Wl,--hash-style=gnu,-L/opt/ecomorph/lib" \
  CFLAGS="-I/opt/ecomorph/include $CFLAGS" \
  CPPFLAGS="-I/opt/ecomorph/include $CFLAGS" \
  PKG_CONFIG_PATH="/opt/ecomorph/lib/pkgconfig:$PKG_CONFIG_PATH" \
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  mkdir -p "$pkgdir"/usr/bin
  ln -s /opt/ecomorph/bin/ecomp.sh "$pkgdir"/usr/bin/ecomp.sh
  ln -s /opt/ecomorph/bin/ecomorph.sh "$pkgdir"/usr/bin/ecomorph.sh
  
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -D -m644 COPYING-PLAIN $startdir/pkg/usr/share/licenses/$pkgname/COPYING-PLAIN

}
