# Contributer: N30N <archlinux@alunamation.com>

pkgname=alchemy
pkgver=008
pkgrel=1
pkgdesc="Sketch, draw, and create on computers in new ways"
url="http://al.chemy.org/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("java-runtime" "jpen")
makedepends=()
source=(${url}files/Alchemy-${pkgver}.tar.gz \
	"alchemy.png" \
	"alchemy.desktop" \
)
md5sums=("c900de439c3c2faf9abe17b6f6a55720" \
	"9bcfe1285e5e02fcc3ff125e44eee6a9" \
	"88e4f7ac40176920b0770bb32c8061fb" \
)

build() {
	cd ${srcdir}
	install -D -m644 alchemy.png ${pkgdir}/usr/share/pixmaps/alchemy
	install -D -m644 alchemy.desktop ${pkgdir}/usr/share/applications/alchemy.desktop

	cd Alchemy
	sed "0,/^cd.*/s//cd \/opt\/alchemy/" -i Alchemy
	if [ ${CARCH} == "x86_64" ]; then
		sed "2 aLD_LIBRARY_PATH=lib" -i Alchemy
		install -d ${pkgdir}/opt/alchemy/lib
		ln -s /usr/lib/libjpen-2.so ${pkgdir}/opt/alchemy/lib/libjpen-2-2-x86_64.so
	else
		sed "2 aLD_LIBRARY_PATH=/usr/lib" -i Alchemy
	fi

	install -D -m755 Alchemy ${pkgdir}/usr/bin/alchemy
	install -D -m644 Alchemy.pdf ${pkgdir}/opt/alchemy/Alchemy.pdf
	install -D -m644 Alchemy.jar ${pkgdir}/opt/alchemy/Alchemy.jar

	for _module in modules/*; do
		install -D -m644 ${_module} ${pkgdir}/opt/alchemy/${_module}
	done
	for _shape in shapes/*/*; do
		install -D -m644 ${_shape} ${pkgdir}/opt/alchemy/${_shape}
	done
}

# vim: set noet ff=unix
