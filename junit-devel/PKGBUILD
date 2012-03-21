# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=junit-devel
pkgver=4.10
pkgrel=1
pkgdesc="Java unit testing framework"
arch=('i686' 'x86_64')
url="http://junit.org"
license=('CPL')
depends=('java-runtime' 'hamcrest')
provides=('junit')
conflicts=('junit')
noextract=('*.jar')
source=(http://cloud.github.com/downloads/KentBeck/${provides}/${provides}-dep-${pkgver//_/-}.jar)

build() {
    cd $srcdir
	install -D -m644 ${provides}-dep-${pkgver//_/-}.jar $pkgdir/usr/share/java/${provides}.jar
}

md5sums=('7737f24b3361170908fc87242a1c0e68')
sha256sums=('e1ff27e80d39c7a5a149faf499f13dbf7f7205808874a3265e49c282ed94d0a7')
