pkgname=opensubdiv
pkgdesc="An Open-Source subdivision surface library."
pkgrel=1
arch=(any)
pkgver=git
url="https://github.com/PixarAnimationStudios/OpenSubdiv"
license="Modified Apache 2.0 License"

makedepends=('cmake')
# Surely there is more dependencies
depends=('glfw' 'ptex' 'doxygen')

source=('git+https://github.com/PixarAnimationStudios/OpenSubdiv.git')
md5sums=('SKIP')

build()
{
	cd "$srcdir/OpenSubdiv/"
	cmake -DCMAKE_INSTALL_PREFIX=/usr/ .

	# for an unknown reason, make fails the first time
	make || make
}
package()
{
	cd "$srcdir/OpenSubdiv/"
	make DESTDIR=${pkgdir} install
}


