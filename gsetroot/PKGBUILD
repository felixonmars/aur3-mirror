# Contributor: Priyank M.G. <priyankmg@gmail.com>

pkgname=gsetroot
pkgver=1.1
pkgrel=1
pkgdesc="gsetroot is a gtk-based front-end for Esetroot."
url="http://gsetroot.sourceforge.net"
depends=('gtk2' 'eterm')
source=("http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('611ec41489ef50405aca545e32edf264')

build()
{
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr 
	make || return 1
	make DESTDIR=$startdir/pkg install
	#libtool slay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
