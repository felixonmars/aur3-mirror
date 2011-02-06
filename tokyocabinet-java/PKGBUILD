# Contributor: Vitaliy Berdinskikh ur6lad[at]archlinux.org.ua

pkgname=tokyocabinet-java
pkgver=1.24
pkgrel=1
pkgdesc="Tokyo Cabinet's API for Java"
arch=('i686' 'x86_64')
url="http://1978th.net/tokyocabinet"
depends=('java-environment' 'tokyocabinet')
license=('LGPL 2.1')
source=(${url}/javapkg/${pkgname}-${pkgver}.tar.gz setClasspath.sh)

build() {
	mkdir -p ${pkgdir}/usr/share/java/tokyocabinet

	cd $srcdir/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/${pkgname}-${pkgver}

	make DESTDIR=$pkgdir install
	mv ${pkgdir}/usr/lib/tokyocabinet.jar ${pkgdir}/usr/share/java/tokyocabinet
}

md5sums=('cb7db713865cedf255916691daa522d2'
         '4da350fcef11b7838b588bc8dff3edda')
sha256sums=('4e5a9bb00f8f322adb0686939a21f7537d7991ae993b250da0a99585ede4e23d'
            'f3974eae267e53a076c341eb5ad6e4ff3f0a206e32f8e02253446fbef57d4b19')
