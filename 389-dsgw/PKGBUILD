# Maintainer: Sergio A. Morales <sergiomorales@archlinux.cl>
# Contributor: Sergio A. Morales <sergiomorales@archlinux.cl>
pkgname=389-dsgw
pkgver=1.1.7
pkgrel=1
pkgdesc="389 Directory Server Gateway (dsgw)"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org"
license=(GPL)
depends=('389-admin')
source=("$url/sources/$pkgname-$pkgver.tar.bz2")
md5sums=('367537e786006adf8f204974b62c282b')

build() {
	cd $startdir/src/$pkgname-$pkgver
	[ "${CARCH}" == "x86_64" ] && export USE_64=1
	./configure --prefix=/usr --sysconfdir=/etc --disable-rpath \
	--with-adminutil=/usr
	make || return 1
        make install DESTDIR=$pkgdir || return 1
}
