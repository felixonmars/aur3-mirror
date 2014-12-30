# Contributor: Tibor Bamhor <tiborb95 at gmail.com>

pkgname=repokeeper
pkgver=0.2.1
pkgrel=2
pkgdesc="Builds and updates local repository of AUR packages."
url="http://code.google.com/p/repokeeper/"
license="GPL-3"
arch=('i686' 'x86_64')
depends=(python python-simplejson python-distribute)
makedepends=(subversion)
backup=('etc/repokeeper.conf')

_svntrunk="http://repokeeper.googlecode.com/svn/trunk/"
_svnrev=3

package() {

svn checkout -r${_svnrev} ${_svntrunk}

#defining variables
work_dir=$srcdir/trunk/

#building
cd $work_dir

#copying file into pkgdir to be packed
mkdir -p $pkgdir/usr/bin
install -m 755 repokeeper.py $pkgdir/usr/bin/

mkdir -p $pkgdir/etc/
install -m 744 repokeeper.conf $pkgdir/etc/

}


