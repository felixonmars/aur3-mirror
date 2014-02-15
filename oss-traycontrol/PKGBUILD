pkgdesc="OSS volume tray control"
pkgname=oss-traycontrol
pkgver=0.22
pkgrel=1

arch=(i686 x86_64)
license=('CCPL:by')
depends=('pygtk' 'python2' 'oss')
replaces=('oss-volume-tray-control')
source=('http://moscwich.net/data/oss-traycontrol-0-22.tar.gz')
md5sums=('c36d12a0105a34e7b040bbe32f90722a')
url=('http://aur.archlinux.org/packages/oss-traycontrol')

build() {
	echo "#! /bin/sh
python2 /usr/share/ossvolume/volume.py" > ossvolume
	chmod a+x ossvolume
}
package() {
	rm -f "${srcdir}/`basename $source`"
	dir=${pkgdir}/usr/share/ossvolume; mkdir -p "$dir"
	cp -RT "${srcdir}" "$dir"
	bin=${pkgdir}/usr/bin; mkdir -p "$bin"
	mv "$dir/ossvolume" "$bin/ossvolume"
}
