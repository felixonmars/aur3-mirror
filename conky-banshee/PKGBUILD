# Contributor: Iven Day <ivenvd#gmail.com>
# Contributor: KittyKatt
pkgname=conky-banshee
_realname=conkybanshee
_realname2=conkyBanshee
pkgver=2.01
pkgrel=3
pkgdesc="Banshee info, for use in Conky."
arch=('i686' 'x86_64')
url=('https://code.launchpad.net/~m-buck/+junk/conkybanshee')
license=('GPL')
depends=('python2' 'conky' 'banshee')
source=(http://ppa.launchpad.net/m-buck/conky/ubuntu/pool/main/c/$_realname/${_realname}_$pkgver.tar.gz)
md5sums=('cfb05fe02d20cf334a1ff0f11695d3fd')

build()
{
	cd $srcdir/src
	sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" setup.py

	cat $_realname2 | sed 's/\$PYTHONPATH //' | tee conkyBanshee >/dev/null

	python2 setup.py build
}

package() {
	cd $srcdir/src
	python2 setup.py install --root=$pkgdir

	sed -i "s|/usr/bin/python|/usr/bin/python2|" $pkgdir/usr/bin/$_realname2
	sed -i "s|#!/usr/bin/python$|#!/usr/bin/python2|" $pkgdir/usr/share/$_realname/$_realname2.py

}
