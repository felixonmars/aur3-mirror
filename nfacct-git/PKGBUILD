pkgname=nfacct-git
pkgver=20120730
pkgrel=1
pkgdesc="Utility for the extended accounting infrastructure for Netfilter/iptables."
url="http://netfilter.org"
license=('GPL2')
depends=('libmnl' 'libnetfilter_acct')
makedepends=('git')
provides=('nfacct')
conflicts=('nfacct')
arch=('i686' 'x86_64')
options=('!libtool')

_gitroot="git://git.netfilter.org/nfacct.git"
_gitname="nfacct.git"

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

  if [[ -f autogen.sh ]]; then
    ./autogen.sh
  else
    autoreconf -fiv
  fi

  ./configure --prefix=/usr
  make V=1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
} 
