# Contributer: N30N <archlinux@alunamation.com>

pkgname=alchemy
pkgver=008
pkgrel=2
pkgdesc="Sketch, draw, and create on computers in new ways"
url="http://al.chemy.org/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("java-runtime")
optdepends=("jpen: for tablet support")
makedepends=()
source=("${url}files/Alchemy-${pkgver}.tar.gz" \
	"alchemy.png" \
	"alchemy.desktop" \
)
md5sums=("c900de439c3c2faf9abe17b6f6a55720" \
	"9bcfe1285e5e02fcc3ff125e44eee6a9" \
	"88e4f7ac40176920b0770bb32c8061fb" \
)

build() {
	cd Alchemy

	sed "0,/^cd.*/s//cd \/opt\/alchemy/" -i Alchemy

	if [ ${CARCH} == "x86_64" ]; then
		sed "2 aLD_LIBRARY_PATH=lib" -i Alchemy
	else
		sed "2 aLD_LIBRARY_PATH=/usr/lib" -i Alchemy
	fi
}

package() {
	if [ ${CARCH} == "x86_64" ]; then
		install -d "${pkgdir}/opt/alchemy/lib"
		ln -s /usr/lib/libjpen-2.so \
			"${pkgdir}/opt/alchemy/lib/libjpen-2-2-x86_64.so"
	fi

	install -D -m644 alchemy.png \
		"${pkgdir}/usr/share/pixmaps/alchemy.png"
	install -D -m644 alchemy.desktop \
		"${pkgdir}/usr/share/applications/alchemy.desktop"

	cd Alchemy
	install -d "${pkgdir}/opt/alchemy/lib" \
		"${pkgdir}/opt/alchemy/modules"
	install -D -m755 Alchemy "${pkgdir}/usr/bin/alchemy"
	install -m644 Alchemy.pdf Alchemy.jar "${pkgdir}/opt/alchemy/"
	install -m644 modules/* "${pkgdir}/opt/alchemy/modules/"

	for _shape in shapes/*/*; do
		install -D -m644 ${_shape} ${pkgdir}/opt/alchemy/${_shape}
	done
}

# vim: set noet ff=unix
