# Contributor : Sebastien Duquette <ekse.0x@gmail.com>

pkgname=sagan-svn
pkgver=22
pkgrel=1
pkgdesc="a snort-like log analysis engine"
arch=('i686' 'x86_64')
url="http://sagan.softwink.com"
license=('GPL')
depends=('sagan-rules' 'pcre' 'libesmtp' 'mysql-clients' 'postgresql-libs')
makedepends=('autoconf' 'automake')
source=()
md5sums=()

_svntrunk=http://svn.softwink.com/svn/repos/sagan/trunk
_svnmod=sagan

build() {
  cd $srcdir
  svn co $_svntrunk -r $pkgver $_svnmod
  cd $_svnmod 
  msg "Starting build..."
  ./configure --prefix=/opt/sagan/ 
  make || return 1
  sed "s:^var RULE_PATH.*$:var RULE_PATH /opt/sagan/rules/:" etc/sagan.conf > etc/sagan.conf.new
  mv etc/sagan.conf.new etc/sagan.conf 

}

package() {
  cd $srcdir/$_svnmod
  make DESTDIR="${pkgdir}" install
}
