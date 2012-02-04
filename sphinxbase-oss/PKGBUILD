# Maintainer: Markus Jochim <dev at markusjochim de>
# Contributor: Mathias L. Baumann <marenz at supradigital org>
# Contributor: trontonic <rodseth at gmail com>

pkgname=sphinxbase-oss
_basepkgname=sphinxbase
pkgver=0.4.1
pkgrel=3
pkgdesc="Common library for sphinx speech recognition - OSS version"
url="http://cmusphinx.sourceforge.net/"
arch=(i686 x86_64)
license=('BSD')
options=('!libtool')
source="http://downloads.sourceforge.net/cmusphinx/$_basepkgname-$pkgver.tar.gz"
md5sums=('b3b34a4de1040e0c54c2698c8ed4aa44')
provides=('sphinxbase=0.4.1')
conflicts=('sphinxbase')
_pythondir="$startdir/pkg/usr/lib/python2.6/site-packages"

build() {
	cd $startdir/src/$_basepkgname-$pkgver/src/libsphinxad
	patch < ../../../../ad_oss.c.nosetsrc.patch || return 1
	cd $startdir/src/$_basepkgname-$pkgver
	patch < ../../configure.in.oss.patch || return 1
	./autogen.sh --prefix=/usr || return 1
	make || return 1
	mkdir -p $_pythondir
	PYTHONPATH=$_pythondir make DESTDIR=$startdir/pkg install || return 1
	rm $_pythondir/site.py*
	mkdir -p $startdir/pkg/usr/share/licenses/$_basepkgname
	install -m644 COPYING $startdir/pkg/usr/share/licenses/$_basepkgname/
}

