# Maintainer: Pavel Sevecek <pavel dot sevecek et gmail dot com>
pkgname=acvd-git
pkgver=r50.25bb6d1
pkgrel=1
pkgdesc="A program to perform fast simplification of 3D surface meshes."
arch=('i686' 'x86_64')
url="http://www.creatis.insa-lyon.fr/site/en/acvd"
license=('custom')
depends=('vtk>=5.0')
makedepends=('cmake' 'git')
provides=('acvd')
install='acvd.install'
source=("git://github.com/valette/ACVD.git")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/ACVD"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}
build() {
	cd "$srcdir/ACVD"
	cmake -DCMAKE_INSTALL_PREFIX=/usr\
	      -DCMAKE_BUILD_TYPE=Release\
	      -DCMAKE_SKIP_BUILD_RPATH=true
	make
}
package() {
	cd "$srcdir/ACVD"
	install -m 0755 -D "$srcdir/ACVD/bin/ACVD" "$pkgdir/usr/bin/acvd"
	install -m 0755 -D "$srcdir/ACVD/bin/ACVDQ" "$pkgdir/usr/bin/acvdq"
	install -m 0755 -D "$srcdir/ACVD/bin/libvtkSurface.so"\
	                    "$pkgdir/usr/lib/libvtkSurface.so"
	install -m 0755 -D "$srcdir/ACVD/bin/libvtkDiscreteRemeshing.so"\
	                   "$pkgdir/usr/lib/libvtkDiscreteRemeshing.so"
	install -m 0755 -D "$srcdir/ACVD/bin/libvtkVolumeProcessing.so"\
	                   "$pkgdir/usr/lib/libvtxVolumeProcessing.so"
	install -m 0644 -D "$srcdir/ACVD/LICENSE.txt"\
	                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
