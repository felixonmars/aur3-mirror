# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
pkgname=usmb
pkgver=20100404
pkgrel=1
pkgdesc="Mount SMB shares via fuse"
arch=('i686' 'x86_64')
url="http://www.ametros.net/code.html"
license=('GPL')
depends=('fuse' 'smbclient' 'krb5' 'libldap' 'libxml2')
source=(
	"http://www.herecura.be/files/$pkgname-$pkgver.tar.gz"
	'password.patch'
)
md5sums=(
	'0f50859276fc852b8afdb1bf19bf1e25'
	'707f0889abc7ad7a41b45321ebaf36d4'
)

build() {
	cd ${pkgname}
	patch -p0 -i ${srcdir}/password.patch
	# automake
	autoreconf
	# configure
	./configure --prefix=/usr
	# make
	make
}

package() {
	cd ${pkgname}
	make DESTDIR="$pkgdir/" install
}
