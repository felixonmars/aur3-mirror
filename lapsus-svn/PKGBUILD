# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=lapsus-svn
pkgver=98
pkgrel=1
pkgdesc="SVN version of Lapsus - program controlling additional features of Asus and IBM laptops for KDE3."
arch=('i686' 'x86_64')
url="http://lapsus.berlios.de"
license=('GPL')
depends=('dbus' 'qt3' 'kdelibs3' 'alsa-lib')
makedepends=('subversion' 'autoconf')
provides=('lapsus')
conflicts=('lapsus')
install=lapsus.install
source=(lapsus.rc_script)
md5sums=('78ea871f3a87d24166f3c1d344391b9c')

_svntrunk=svn://svn.berlios.de/lapsus/trunk
_svnmod=lapsus

build() {
  cd $startdir/src/
  msg "Doing SVN checkout ..."
  svn co $_svntrunk $_svnmod -r $pkgver || return 1
  msg "SVN checkout finished, starting build ..."
  cd $_svnmod

  . /etc/profile.d/qt3.sh
  PATH=$QTDIR/bin:$PATH

  export PKG_CONFIG_PATH=/usr/lib/pkgconfig/:$PKG_CONFIG_PATH

  make -f Makefile.cvs
  ./configure --without-arts
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m0644 lapsus.conf $startdir/pkg/etc/dbus-1/system.d/lapsus.conf
  install -D -m0755 ${startdir}/lapsus.rc_script $startdir/pkg/etc/rc.d/lapsusd
}
