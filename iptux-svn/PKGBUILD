#Contributor: lh<jarryson@gmail.com>

pkgname=iptux-svn
pkgver=80
pkgrel=1
pkgdesc="Lan communication software, compatiable with IP Messenger."
arch=('i686' 'x86_64')
url="http://code.google.com/p/iptux/" 
license=('GPL')
depends=("gtk2" "gconf")
makedepends=('make' 'subversion')
provides=('iptux')
replaces=('iptux')
conflicts=('iptux')
source=()
md5sums=()
install=iptux.install

_svntrunk=http://iptux.googlecode.com/svn/trunk/
_svnmod=iptux

build() { 
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."
  ./configure --prefix=/usr || return 1
  make ||return 1
  make DESTDIR=$startdir/pkg install
}
