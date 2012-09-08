pkgname=conntrack-tools-git
pkgver=20120908
pkgrel=1
pkgdesc="Tools to manipulate netfilter connection tracking table"
url="http://netfilter.org"
license=('GPL2')
makedepends=('git')
depends=('libmnl' 'libnetfilter_conntrack' 'libnetfilter_cthelper' 'libnetfilter_cttimeout' 'libnetfilter_queue' 'libnfnetlink')
provides=('conntrack-tools')
conflicts=('conntrack-tools')
options=('!libtool')
arch=('i686' 'x86_64')

_gitroot="git://git.netfilter.org/conntrack-tools.git"
_gitname="conntrack-tools.git"

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

  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
