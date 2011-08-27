# Contributor: Glenn 'RedShift' Matthys <glenn@opengate.be>
pkgname=mod_ruid
pkgver=0.6b
pkgrel=1
pkgdesc="mod_ruid is suexec module for apache 2.0, based on mod_suid2"
arch=(
	'i686'
	'x86_64'
)
url="http://websupport.sk/~stanojr/projects/mod_ruid/"
license=('APACHE')
depends=('apache' 'libpcap')
makedepends=('apache')
provides=()
source=(http://websupport.sk/~stanojr/projects/mod_ruid/$pkgname-$pkgver.tar.gz)
md5sums=('6e1e5f0b64f458cff95722854939ddcf')

build() {
	cd "$startdir/src/$pkgname-$pkgver"
	apxs -l cap -c mod_ruid.c
	install -D -m755 .libs/mod_ruid.so $startdir/pkg/usr/lib/apache/mod_ruid.so
}
