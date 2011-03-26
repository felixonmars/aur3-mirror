# Conntributor: Matthew Bauer <mjbauer95@gmail.com>
pkgname=ips.pl
pkgver=0.01
pkgrel=1
pkgdesc="This is a Perl script which is designed to apply an IPS patch to a ROM. It is a quick hack according to the author, but it seems to work OK for me. It is released under the terms of the GNU GPL."
arch=(any)
url="http://www.zophar.net/utilities/patchutil/ips-pl.html"
license=('custom')
depends=(perl)
source=(http://www.zophar.net/fileuploads/1/3142ixteo/ips.txt)
md5sums=('671181a1b7873c96a6f78dcc70be8a7c')

build() {
	cd $srcdir;
	mkdir -p $pkgdir/usr/bin;
	cp ips.txt $pkgdir/usr/bin/ips.pl;
	chmod +x $pkgdir/usr/bin/ips.pl;
}
