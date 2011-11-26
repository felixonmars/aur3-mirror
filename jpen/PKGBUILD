# Contributer: N30N <archlinux@alunamation.com>
# Contributer: niQo <niqooo@gmail.com>
# Contributer: trontonic <rodseth@gmail.com>
# Contributer: lolilolico

pkgname=jpen
pkgver=2.111002
pkgrel=1
pkgdesc="A Java library for accessing pen/digitizer tablets and pointing devices."
url="http://sf.net/apps/mediawiki/jpen"
license=("GPL3")
arch=("i686" "x86_64")
depends=()
makedepends=("java-environment")
source=("http://downloads.sf.net/${pkgname}/${pkgname}-${pkgver/./-}-src.zip")
sha256sums=("58c4fa60bbd6763c0491fffde4df1db72380b5d1922533f112849f8e9caa4cf5")

build() {
	cd "${pkgname}-${pkgver/./-}/src/main/c/linux"

	gcc ${CFLAGS} \
		-I/opt/java/include \
		-I/opt/java/include/linux \
		-I/usr/lib/jvm/java-6-openjdk/include \
		-I/usr/lib/jvm/java-6-openjdk/include/linux \
		-I/usr/lib/jvm/java-7-openjdk/include/ \
		-I/usr/lib/jvm/java-7-openjdk/include/linux \
		-Wall -fpic -shared -o libjpen-2.so -lXi *.c
}

package() {
	cd "${pkgname}-${pkgver/./-}/src/main/c/linux"

	install -D -m755 libjpen-2.so "${pkgdir}/usr/lib/libjpen-2.so"
}

# vim: set noet ff=unix
