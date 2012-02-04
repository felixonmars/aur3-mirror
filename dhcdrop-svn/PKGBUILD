# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=dhcdrop-svn
pkgver=116
pkgrel=1
pkgdesc="Remove illegal dhcp servers with IP-pool underflow. SVN version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/madwimax/"
license=('GPL2')
depends=('libpcap')
makedepends=('subversion')
provides=('dhcdrop')
   
 _svnmod="dhcdrop"
 _svntrunk="https://svn.codenet.ru/netpatch/dhcdrop/trunk"
 
 build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build

  autoreconf --install
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
# vim:syntax=sh
