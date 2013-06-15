# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Tomasz Zok <tomasz.zok [AT] gmail.com>
pkgname=usmb
pkgver=20130204
pkgrel=1
pkgdesc="Mount SMB shares via fuse"
arch=('i686' 'x86_64')
url="http://www.ametros.net/code.html"
license=('GPL')
depends=('fuse' 'smbclient>=4' 'krb5' 'libldap' 'libxml2')
source=("http://www.herecura.be/files/${pkgname}-${pkgver}.tar.gz")

build() {
	cd ${pkgname}
	# automake
	autoreconf
	# configure
	./configure --prefix=/usr
	# make
	C_INCLUDE_PATH=/usr/include/samba-4.0/ make
}

package() {
	cd ${pkgname}
	make DESTDIR="$pkgdir/" install
}

sha256sums=('c28851bf13cde7292d07cffce2cf4d216eb7e1e3239d3c7a0c7713e7d2375ca7')
