# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=kio-fuse-svn
pkgver=
pkgrel=1
provides=('kio-fuse')
conflicts=('kio-fuse')
pkgdesc="KIO (KDE I/O Slaves) to FUSE (Filesystem in UserSpacE) Gateway, allows to 'mount' KIO slaves"
url="http://kde.ground.cz/tiki-index.php?page=KIO+Fuse+Gateway"
depends=('kdelibs' 'fuse')
makedepends=('subversion' 'unsermake')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdenonbeta
_svnbranch=svn://anonsvn.kde.org/home/kde/branches/KDE/3.5/kde-common
_svnmod=fuse_kio
_svnmodb=admin

build() {
  cd $startdir/src
  touch ~/.subversion
  svn co -N $_svntrunk
  cd kdenonbeta
  svn co $_svnbranch/$_svnmodb
  svn co $_svntrunk/$_svnmod

  unsermake -f Makefile.cvs
  ./configure --prefix=/opt/kde
  unsermake || return 1
  cd $_svnmod
  unsermake || return 1
  unsermake DESTDIR=$startdir/pkg install
}
