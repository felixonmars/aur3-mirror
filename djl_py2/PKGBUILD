# Contributor: aleksonik  imsnet@yandex.ru

pkgname=djl_py2
pkgver=1.2.20
pkgrel=1
pkgdesc="A game manager inspired by Steam from Valve software which makes it possible via a repository to download, install and remove a reasonable number of games."
arch=(i686 x86_64)
url="http://www.djl-linux.org/"
license=('gpl')
depends=('python2' 'python2-qt')
conflicts=('djl')
source=(
	"http://en.djl-linux.org/maj_djl/archives/djl-${pkgver}.tar.gz"
	"configuration.py2.patch"
	"diff.py2.patch"
	"djl.py2.patch"
	"djl.sh-py2.patch"
	"i18n.py2.patch"
	"installe.py2.patch"
)

md5sums=(
	'caa7667e03acaff489b6f23977868297'
	'fc76f317ad2811ea72e86bc277ad6f0f'
	'4c237ba99fee0bed272ae66fe1a26d2c'
	'f6ffe257bd9af363f9a4f0f696a90051'
	'1d1ffa6250f48f35584c7887059e57bc'
	'5ca5cf953afc9611214c84a4c65dd10b'
	'08e17dde7cf1d6776c7d4244f8f8b41e'
)


build() {
	cd $srcdir/djl

	patch ./djl.sh -i  ../../djl.sh-py2.patch
	patch ./djl/configuration.py -i ../../configuration.py2.patch
	patch ./djl/diff.py -i ../../diff.py2.patch
	patch ./djl/djl.py -i ../../djl.py2.patch
	patch ./djl/i18n.py -i ../../i18n.py2.patch
	patch ./djl/installe.py -i ../../installe.py2.patch


	find $srcdir/ -name '*.py' | xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
	find $srcdir/ -name '*.py' | xargs sed -i "s|#! /usr/bin/env python$|#!/usr/bin/env python2|"

	find $srcdir/ -name '*.py' | xargs sed -i "s|#!/usr/bin/python$|#!/usr/bin/python2|"
	find $srcdir/ -name '*.py' | xargs sed -i "s|#! /usr/bin/python$|#!/usr/bin/python2|"


        mkdir -p $pkgdir/usr/share/djl
        cp -r $srcdir/djl/* $pkgdir/usr/share/djl


        mkdir -p $pkgdir/usr/bin/
        echo "/usr/share/djl/djl.sh" > $pkgdir/usr/bin/djl
        chmod 755 $pkgdir/usr/bin/djl
}


