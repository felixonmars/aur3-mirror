pkgname=packet-o-matic-svn
pkgver=372
pkgrel=1
pkgdesc="A modular network sniffer and packet processor"
arch=('i686' 'x86_64')
url="http://www.packet-o-matic.org/"
license=('GPL')
depends=('sqlite' 'libpcap' 'net-snmp' 'xmlrpc-c' 'libmysqlclient')
makedepends=('subversion' 'libtool' 'automake')
backup=()
options=()

_svntrunk=https://svn.tuxicoman.be/svn/packet-o-matic/trunk
_svnmod=packet-o-matic

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
