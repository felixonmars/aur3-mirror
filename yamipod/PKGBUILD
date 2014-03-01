# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=yamipod
pkgver=2.0
pkgrel=2
pkgdesc="Yet another iPod manager."
arch=('i686' 'x86_64')
url="http://www.yamipod.com"
license=('GPL')
source=('http://download1.schoonzie.com/yam-linux.tar.gz')
md5sums=('faa9e82ef1bf2229cde130d4d9f716f9')

build () {
	cd $startdir/src/yam-linux
	mkdir -p $pkgdir/usr/{lib,share/yamipod,bin}
	mv libfmodex* $pkgdir/usr/lib
	mv * $pkgdir/usr/share/yamipod
	echo -e "#!/bin/bash\n\n/usr/share/yamipod/YamiPod" >$pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
}
