# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
pkgname=which4j
pkgver=0.21
pkgrel=1
pkgdesc="Find occurrences of a class in your classpath or any ClassLoader"
arch=('i686' 'x86_64')
url="https://which4j.dev.java.net/"
license="BSD"
depends=('java-runtime')
source=(https://which4j.dev.java.net/files/documents/785/1465/$pkgname-${pkgver//./_}.tar.gz which4j.sh)
md5sums=('91e2b4726583eb8fc6df226b441a1eb5'
         'e043799ebc46eafa8b1c2a54c0f2b61e')
sha1sums=('eab39b4f6967a5e9d220995461ee72a3d9e01b1d'
          'a4af42be90d22445b7906d3389e2c1ed5e0ee809')

build() {
    install -D -m 755 $startdir/src/$pkgname.sh $startdir/pkg/usr/bin/${pkgname}
    install -D -m 644 $startdir/src/$pkgname-$pkgver/lib/$pkgname.jar $startdir/pkg/usr/share/java/$pkgname/${pkgname}.jar
}
