# Contributor: bekks <eduard.warkentin@gmail.com>
pkgname=mirrordir
pkgver=0.10.49
pkgrel=5
pkgdesc="backup whole directory structures"
arch=('i686')
url="http://linux.maruhn.com/sec/mirrordir.html"
license="GPL"
depends=(shadow tcp_wrappers)
source=(ftp://ftp.heanet.ie/pub/gnewsense/gnewsense/pool/universe/m/${pkgname}/${pkgname}_${pkgver}-intl.orig.tar.gz)
md5sums=('3960390645543ad75890296ff9d7750a')

build() {
	cd $startdir/src/$pkgname-$pkgver-intl
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$startdir/pkg install
	cd $startdir/pkg/usr/bin
	ln -s mirrordir ./copydir
	ln -s mirrordir ./pslogin
	ln -s mirrordir ./recursdir
	mkdir -p $startdir/pkg/etc/ssocket
	mv $startdir/pkg/usr/etc/ssocket/*.* $startdir/pkg/etc/ssocket/
	rm -rf $startdir/pkg/usr/etc/
}
