# Contributor: Christoph Siegenthaler <csi@gmx.ch>
pkgname=smbat
pkgver=1.0.7
pkgrel=1
pkgdesc="SMB (password) Auditing Tool for the Windows-and the SMB-platform"
url="http://www.cqure.net/wp/?page_id=10"
makedepends=('openssl')
depends=('openssl')
source=('http://www.cqure.net/tools/'$pkgname'-src-'$pkgver'.tar.gz')
md5sums=('84b8c06c041f0365100babfe454bf10b')

build(){
	cd $startdir/src/$pkgname
	./configure --prefix=/usr --with-openssl=/usr/
	make || return 1
	mkdir -p $startdir/pkg/usr/bin
	mv bin/* $startdir/pkg/usr/bin
}
