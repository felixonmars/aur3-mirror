pkgname=ettercap-drizzbsd
pkgver=20111116
_origver=NG_0.7.4
pkgrel=1
pkgdesc="A network sniffer/interceptor/logger for ethernet LANs - console and GTK (drizzbsd fork)"
arch=('i686' 'x86_64')
url="https://github.com/drizztbsd/ettercap"
license=('GPL')
depends=('ncurses' 'openssl' 'libpcap>=1.0.0' 'zlib' 'pcre' 'libtool>=2.2.4' 'libnet')
makedepends=('libnet' 'git' 'autoconf' 'automake' 'pkgconfig' 'flex' 'bison')
options=(!libtool)
conflicts=('ettercap' 'ettercap-gtk')
_gitroot="https://github.com/drizztbsd/ettercap.git"
_gitname="ettercap"


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
  ./autogen.sh
  ./configure --prefix=/usr --datarootdir=/usr/share
  make all || return 1
  make DESTDIR=$pkgdir install || return 1
}


