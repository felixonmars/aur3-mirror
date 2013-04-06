# Contributor: T-T

if [ -f ./pkgvrs ]; then
	pkgvrs=$(cat ./pkgvrs)
else
	until [[ "$pkgvrs" =~ ^r[0-9]+$ ]]; do
		echo -n 'Choose version (r25151): '
		read pkgvrs
		echo -n 'md5sum (3faf114322ca303cd5fc547c78a2729b): '
		read md5
	done
fi
if test -f ./pkgvrs; then rm pkgvrs; else echo "$pkgvrs" > pkgvrs; fi

if [ "${CARCH}" = 'x86_64' ] ; then
	_arch='amd64'
else
	_arch="i686"
fi

pkgname=openttd-trunk-bin
pkgver='r25151'
if test "$pkgvrs"; then pkgver=$(echo "$pkgvrs" | sed 's/-\|:/_/g'); pkgname="openttd-bin-$pkgvrs"; fi
pkgrel=0
pkgdesc="This package let you have installed more versions simultaneously. Package version means tested version, it should work for actual version too, mark as outdated only if stop working for new versions."
arch=('i686' 'x86_64')
url="http://www.openttd.org"
license=('GPL')
depends=(libpng sdl fontconfig icu)
makedepends=()
conflicts=('')
optdepends=('openttd-opengfx: free graphics' 'openttd-opensfx: free soundset' 'openttd-openmsx: free musicset')
source=(http://binaries.openttd.org/nightlies/trunk/${pkgvrs}/openttd-trunk-${pkgvrs}-linux-generic-${_arch}.tar.xz)
md5sums=(${md5})

build() {
	cd ${srcdir}/openttd-trunk-${pkgvrs}-linux-generic-${_arch}
	name=openttd-${pkgvrs}

	mkdir -p ${pkgdir}/usr/share/applications/
	mv media/openttd.desktop ${pkgdir}/usr/share/applications/${name}.desktop
	sed -i "s#Name=OpenTTD#Name=OpenTTD - ${pkgvrs}#;s#Exec=openttd#Exec=${name}#" ${pkgdir}/usr/share/applications/${name}.desktop

	mkdir -p ${pkgdir}/usr/share/doc/${name}/
	mv docs/* ${pkgdir}/usr/share/doc/${name}/

	mkdir -p ${pkgdir}/usr/share/man/man6/
	mv man/openttd.6.gz ${pkgdir}/usr/share/man/man6/${name}.6.gz

	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mv media/openttd.32.xpm ${pkgdir}/usr/share/pixmaps/${name}.32.xpm

	for isize in 16 32 48 64 128 256 ; do
		mkdir -p ${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/
		mv media/openttd.${isize}.png ${pkgdir}/usr/share/icons/hicolor/${isize}x${isize}/apps/${name}.png
	done

	mkdir -p ${pkgdir}/usr/share/${name}
	for d in ./*; do
		mv $d ${pkgdir}/usr/share/${name}/
	done

	mkdir -p ${pkgdir}/usr/bin/
	echo -e "#/bin/sh\ncd /usr/share/${name} && ./openttd \$@" > ${pkgdir}/usr/bin/${name}
	
	chmod +xr ${pkgdir}/usr/bin/${name}
	cd ${pkgdir}/usr/share/${name}
	chmod +x `dir`
	chmod +r `find`
}
