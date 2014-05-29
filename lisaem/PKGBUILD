# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='lisaem'
pkgver='1.2.6'
pkgrel='1'
url='http://lisa.sunder.net'
pkgdesc='Feature-complete Apple Lisa Emulator'
arch=('i686' 'x86_64')
depends=('wxgtk2.8' 'netpbm')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.bz2")
license='custom'
sha1sums=('c3552eb2fc89ff6e47994767aa4e524de7000dc7')

prepare () {
	cd "${pkgname}-${pkgver}"

	# Make a local directory with symbolic links to the wxGtk 2.8
	# utilities. The build system expects them to now have the "-2.8"
	# suffix, so we add this directory to $PATH during build().
	mkdir -p local-bin
	ln -sf /usr/bin/wx-config-2.8 local-bin/wx-config
	ln -sf /usr/bin/wxrc-2.8 local-bin/wxrc
}

build () {
	cd "${pkgname}-${pkgver}"

	PREFIX='/usr' \
	PATH="$(pwd)/local-bin:${PATH}" \
	CXX="g++ -fpermissive -Wno-write-strings" \
		./build.sh --without-debug --without-upx --with-unicode
}

package () {
	cd "${pkgname}-${pkgver}"

	# Executables
	install -Dm755 bin/lisaem "${pkgdir}/usr/bin/lisaem"
	install -Dm755 bin/lisadiskinfo "${pkgdir}/usr/bin/lisadiskinfo"
	install -Dm755 bin/lisafsh-tool "${pkgdir}/usr/bin/lisafsh-tool"

	# Resources
	install -m755 -d "${pkgdir}/usr/share/lisaem"
	install -m644 -t "${pkgdir}/usr/share/lisaem" \
		resources/*.png resources/*.wav resources/*.xpm

	# Some resources use "LisaEm" instead of "lisaem" (Ugh!)
	ln -fs lisaem "${pkgdir}/usr/share/LisaEm"

	# License
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
