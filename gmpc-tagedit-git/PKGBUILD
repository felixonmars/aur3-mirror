#Contributor: Mineo <the_mineo at web dot de>
#Maintainer: sysrmr <sysrmr at gmail dot com>
pkgname=gmpc-tagedit-git
provides=('gmpc-tagedit')
conflicts=('gmpc-tagedit') 
pkgver=20120830
pkgrel=1
pkgdesc="A plugin to edit tags inside gmpc"
url="http://gmpc.wikia.com"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gmpc-git' 'taglib')
makedepends=('git' 'intltool' 'pkgconfig' 'gob2')
options=('!libtool')
source=('0001-Fixed-building-automake-1.12.patch')
md5sums=('693d2e2709505ba599a3aaa5ad825a90')

_gitroot="git://repo.or.cz/gmpc-tagedit.git"
_gitname="gmpc-tagedit"
build() {
	cd $srcdir
	msg "Connecting to $_gitroot server..."
w
	if [ -d $srdir/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	
	msg "Starting make..."

	cp -r $srcdir/$_gitname $srcdir/$_gitname-build
	cd $srcdir/$_gitname-build
	patch -p1 < ../../0001-Fixed-building-automake-1.12.patch
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install 
}

