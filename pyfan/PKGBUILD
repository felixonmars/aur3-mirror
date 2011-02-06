pkgname=pyfan
pkgver=0.0.7
pkgrel=1
pkgdesc="A fanfou.com wrap in python."
arch=(i686 x86_64)
license=('gpl v3')
url="http://code.google.com/p/pyfan/"
depends=('python')
makedepends=('patch')
source=("http://pyfan.googlecode.com/files/pyfan-0.0.7.py"
"http://leafduo.com/pyfan/linux.patch")
md5sums=('6483b58c8aaad997cf902c8fddd6557f'
         '56b7787889d4d55a37d9df8f14fa65c3')
build()
{
	cd $startdir
	mv pyfan-0.0.7.py pyfan.py
	patch <linux.patch
	chmod +x pyfan.py
	mkdir -p $startdir/pkg/usr/bin
	cp pyfan.py $startdir/pkg/usr/bin
}
