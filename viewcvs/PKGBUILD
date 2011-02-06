pkgname=viewcvs
pkgver=0.9.4
pkgrel=1
pkgdesc="Viewcvs, a web interface to cvs and subversion"
url="http://viewcvs.sourceforge.net/"
license="GPL"
depends=('apache' 'python' 'enscript' 'diffutils' 'rcs' )
makedepends=('cvs' 'subversion' 'patch')
conflicts=()
replaces=()
backup=()
install=install.viewcvs
source=(http://viewvc.tigris.org/files/documents/3330/27671/$pkgname-$pkgver.tar.gz \
	viewcvs-install.patch)

build() {
	cd $startdir/src/$pkgname-$pkgver

	# patch to install in $startdir/pkg
	patch -Np0 -i ../viewcvs-install.patch || return 1
	sed -i "s@__ROOTDIR@/usr/share/${pkgname}-${pkgver}@g" viewcvs-install
	sed -i "s@__DESTROOTDIR@${startdir}/pkg/usr/share/${pkgname}-${pkgver}@" viewcvs-install

	./viewcvs-install
	
	install -m 755 -d $startdir/pkg/home/httpd/cgi-bin
	install -m 755 $startdir/pkg/usr/share/$pkgname-$pkgver/cgi/query.cgi  $startdir/pkg/home/httpd/cgi-bin/
	install -m 755 $startdir/pkg/usr/share/$pkgname-$pkgver/cgi/viewcvs.cgi  $startdir/pkg/home/httpd/cgi-bin/
}
md5sums=('a1a09922165f2e2fec08527cdd18b76f' 'b6afe613f412ec1683fc0a2b9a2381ce')
