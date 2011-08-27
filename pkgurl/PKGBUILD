# Maintainer:  Lukas K. <lukas@carrotIndustries.net>

pkgname=pkgurl
pkgver=0.2
pkgrel=3
pkgdesc="pkg:// and aur:// link handler"
arch=('any')
depends=('python' 'pygtk' 'libglade' 'yaourt' 'pacman')
url="http://carrotIndustries.net"
license=('GPL')
source=(http://carrotIndustries.net/download/$pkgname-$pkgver.tar.bz2)
md5sums=('d9bfd5425c51197b1f922a91c0d8b2a5')
install=('pkgurl.install')
build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/usr/bin/
	mkdir -p $startdir/pkg/usr/share/pkgurl
	install -m 0755 pkgurl.py $startdir/pkg/usr/bin/pkgurl
	install -m 0644 pkgurl.glade $startdir/pkg/usr/share/pkgurl/pkgurl.glade
	install -m 0755 setuppkgurl.sh $startdir/pkg/usr/bin/pkgurl-setup
}
