# Maintainer: Jesse Spangenberger <azulephoenix at gmail dot com>

pkgname=xen-tools-git
_gitname="xen-tools"
pkgver=g5ac0f15
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="xen-tools is a collection of simple perl scripts which allow you to easily create new guest Xen domains"
license=('GPL')
url="http://www.xen-tools.org/software/xen-tools/"
depends=('perl-file-slurp' 'perl-text-template' 'perl-config-ini') 
makedepends=("git")
source=("git://gitorious.org/xen-tools/xen-tools.git")
conflicts=("xen-tools")
provides=("xen-tools")
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package () {
	cd $_gitname
	
	make DESTDIR=${pkgdir} prefix=${pkgdir} install
	
	install -dm755 ${pkgdir}/man/man8
	cp -r ${srcdir}/$_gitname/man/* ${pkgdir}/man/man8
}
