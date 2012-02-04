# $Id: PKGBUILD,v 1.4 2006/07/19 21:02:25 andyrtr Exp $
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Cristian Contescu <ckristi@gmail.com>

pkgname=libsafe
pkgver=2.0
pkgrel=16.3
pkgdesc="Detect and handle buffer overflows"
arch=(i686 x86_64)
license=('LGPL')
#source=(http://www.research.avayalabs.com/project/libsafe/src/$pkgname-$pkgver-16.tgz)
#url="http://www.research.avayalabs.com/project/libsafe/"
source=("http://pubs.research.avayalabs.com/src/libsafe-$pkgver-16.tgz"
	"http://itee.elth.pub.ro/~kristi/Arch/LibSafe/libsafe-install.patch")
url='http://www.research.avayalabs.com/gcm/usa/en-us/initiatives/all/nsr.htm&Filter=ProjectTitle:Libsafe&Wrapper=LabsProjectDetails&View=LabsProjectDetails'

build() {
	cd $startdir/src/$pkgname-$pkgver-16/src
	
	patch -p0 -i ../../../libsafe-install.patch || return 1
	mkdir -p $startdir/pkg/usr/lib
	cd ..
	make LIBDIR=$startdir/pkg/usr/lib || return 1
	make LIBDIR=$startdir/pkg/usr/lib  install
	mkdir -p $startdir/pkg/usr/share/man/man8
	cp $startdir/src/$pkgname-$pkgver-16/doc/libsafe.8 $startdir/pkg/usr/share/man/man8
}
md5sums=('6b7b6e6df84d4afb469ccc66d04fc24d'
'f7296706246368dbb40d1fdd428225ad')
