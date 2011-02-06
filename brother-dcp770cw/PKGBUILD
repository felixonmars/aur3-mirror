# Contributor: Richard Kakaš <richard.kakas@gmail.com>

pkgname=brother-dcp770cw
pkgver=1.0.1
pkgrel=1
license=('custom:Brother Industries')
pkgdesc="Brother DCP-770CW CUPS driver"
url="http://solutions.brother.com/linux/en_us/index.html"

arch=('i686' 'x86_64')
depends=()
makedepends=('rpmextract')


install=brother-dcp770cw.install
source=(http://www.brother.com/pub/bsc/linux/dlf/dcp770cwlpr-$pkgver-$pkgrel.i386.rpm
		http://www.brother.com/pub/bsc/linux/dlf/dcp770cwcupswrapper-$pkgver-$pkgrel.i386.rpm
		fix_lp.patch)
md5sums=('8aca733dd71bf5b5b87bef8bd8c579b9' 'fc65f9687866620b3b3aaa6dbfe95045' '70d3e854af7d68cfb6c8e85a7dc9d57a')

build() {
	cd $srcdir
	for i in *.rpm; do
		rpmextract.sh "$i" || return 1
	done
	
	cd ../
	patch -Np0 < fix_lp.patch || return 1

	mkdir -p $pkgdir/usr/bin || return 1
	mkdir -p $pkgdir/var/spool/lpd || return 1
	cp -R $srcdir/usr/bin/* $pkgdir/usr/bin/ || return 1
	cp -R $srcdir/usr/local/ $pkgdir/usr/local/ || return 1
}

