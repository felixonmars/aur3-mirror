# Contributor:Xemertix <arch88(at)katamail(dot)com>

pkgname=ddccontrol-db-svn
pkgver=797
pkgrel=1
pkgdesc="Monitor database for DDCControl"
arch=('i686' 'x86_64')
url="http://ddccontrol.sourceforge.net/"
license=('GPL')
depends=()
makedepends=('subversion' 'wget')
provides=('ddccontrol-db')
conflicts=('ddccontrol-db')
source=()
md5sums=()

_svntrunk=https://ddccontrol.svn.sourceforge.net/svnroot/ddccontrol/trunk/ddccontrol-db/
_svnmod=ddccontrol-db


build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $srcdir/ddccontrol-db

  ./autogen.sh

  aclocal -I m4
  autoconf

  wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.guess'
  wget 'http://savannah.gnu.org/cgi-bin/viewcvs/*checkout*/config/config/config.sub'

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
