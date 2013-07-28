# Contributor: T-T

pkgname=openttd-bin
pkgrel=0
pkgdesc="OpenTTD is an Open Source clone of Transport Tycoon Deluxe. This package let you have installed more versions simultaneously. Package version means tested version, it should work for actual version too, if you type it instead of the one from the opinions."
arch=('i686' 'x86_64')
url="http://www.openttd.org"
license=('GPL')
depends=(libpng sdl fontconfig icu)
makedepends=(coreutils)
conflicts=()
optdepends=('openttd-opengfx: free graphics' 'openttd-opensfx: free soundset' 'openttd-openmsx: free musicset')

if [ "${CARCH}" = 'x86_64' ] ; then
	_arch='amd64'
else
	_arch="i686"
fi

verze="type version here"
if [ -f "./${verze}" ]; then
	pkgver=$(cat "./${verze}")
else
	pkgver=1.3.2
fi

pkgname="openttd-bin-$pkgver"

nazev="openttd-${pkgver}-linux-generic-${_arch}.tar.xz" #for old versions (< 1.1.0) change ".tar.xz" to ".tar.gz"
adresa="http://binaries.openttd.org/releases/${pkgver}/${nazev}"
source=("${adresa}" "${verze}")

wget "${adresa}.md5sum"
_md5_0=$(sed 's/ .*$//g' "./${nazev}.md5sum")
_md5_1=$(md5sum "./${verze}" | sed 's/ .*$//g')
rm "./${nazev}.md5sum"

md5sums=(${_md5_0} ${_md5_1})

build()
{
	cd "${srcdir}/openttd-${pkgver}-linux-generic-${_arch}"
	name="openttd-${pkgver}"
	
	mkdir -p "${pkgdir}/usr/share/applications/"
	mv "./media/openttd.desktop" "${pkgdir}/usr/share/applications/${name}.desktop"
	sed -i "s#Name=OpenTTD#Name=OpenTTD - ${pkgver}#;s#Exec=openttd#Exec=${name}#" "${pkgdir}/usr/share/applications/${name}.desktop"
	
	mkdir -p "${pkgdir}/usr/share/doc/${name}/"
	mv "./docs/"* "${pkgdir}/usr/share/doc/${name}/"
	
	mkdir -p "${pkgdir}/usr/share/man/man6/"
	mv "./man/openttd.6.gz" "${pkgdir}/usr/share/man/man6/${name}.6.gz"
	
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	mv "./media/openttd.32.xpm" "${pkgdir}/usr/share/pixmaps/${name}.32.xpm"
	
	for isize in 16 32 48 64 128 256; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/"
		mv "./media/openttd.${isize}.png" "${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/${name}.png"
	done
	
	mkdir -p "${pkgdir}/usr/share/${name}"
	for d in ./*; do
		mv "$d" "${pkgdir}/usr/share/${name}/"
	done
	
	mkdir -p "${pkgdir}/usr/bin/"
	echo -e "#/bin/sh\ncd /usr/share/${name} && ./openttd \$@" > "${pkgdir}/usr/bin/${name}"
	
	chmod +xr "${pkgdir}/usr/bin/${name}"
	cd "${pkgdir}/usr/share/${name}"
	chmod +x `dir`
	chmod +r `find`
}
