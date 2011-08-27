# Contributor: nosummer <nosummer945@gmail.com>

pkgname='eva-ubuntu'
pkgver='0.4.921+svn42_2ubuntu3'
pkgrel='1'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/evaq'
license=('unknown')
pkgdesc='eva from ubuntu repo'
depends=('kdelibs3' 'qt3' 'nas')
source=(http://mirror.bjtu.edu.cn/ubuntu/pool/universe/e/eva/eva_0.4.921+svn42.orig.tar.gz
	http://mirror.bjtu.edu.cn/ubuntu/pool/universe/e/eva/eva_0.4.921+svn42-2ubuntu3.diff.gz)
md5sums=('09289c18dee9036c61f1d2d07a3f3b76'
	 '1f193051e1e34fd0b2dbe9baec371a34')
install=$pkgname.install
build(){
	cd $srcdir/eva-0.4.921+svn42
	patch -p1 < ../eva_0.4.921+svn42-2ubuntu3.diff
	patch -p1 < debian/patches/02_autotools_update.diff
	patch -p1 < debian/patches/03_libtool_update.diff
	patch -p1 < debian/patches/06_fix_ftbfs_with_gcc43.diff
	patch -p1 < debian/patches/08_translation_update.diff
	patch -p1 < debian/patches/09_fix_gcc44.patch
	./configure --disable-rpath --without-arts
	make
	make DESTDIR=$pkgdir install
}
