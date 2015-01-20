# Maintainer: Alf <naihe2010 [at] 126 [dot] com>

pkgname=115pan
pkgver=4.0
pkgrel=0
pkgdesc='The 115pan client'
arch=('x86_64')
url='http://pc.115.com/linux.html'
source=("http://pc.115.com/download/linux/115wangpan_linux_v${pkgver}.deb")
sha1sums=('167f1eee8f18b7b746474eb297cc5b1bab8fed59')

package(){
	cd ${pkgdir}
	tar xvf ${srcdir}/data.tar.gz
	rm -r usr/lib
	mkdir -p opt/115wangpan
	mv usr lib opt/115wangpan
        mkdir -p usr/bin
	ln -s /opt/115wangpan/usr/bin/115pan usr/bin/115pan
}
