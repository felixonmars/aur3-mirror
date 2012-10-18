# Contributer: giacomogiorgianni@gmail.com 

pkgname=switchablegraphics
pkgver=0.81
pkgrel=1
pkgdesc="This is a manager for switchable graphics made for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Switchable+Graphics?content=154757"
license=('GPL')
depends=('qt>=4.6')
makedepends=('cmake>=2.6')
source=("https://github.com/admiral0/$pkgname/tarball/$pkgver")
md5sums=('d84de8ee25f12b6845888f52e750c5c7')
_gitcommit=96b8790

_optimal_make_jobs() {
	if [ -r /proc/cpuinfo ]; then
		local core_count=$(grep -Fc processor /proc/cpuinfo)
	else
		local core_count=0
	fi

	if [ $core_count -gt 1 ]; then
		echo -n $[$core_count-1]
	else
		echo -n 1
	fi
}

build() {
	cd "$srcdir/admiral0-$pkgname-$_gitcommit"
	mkdir build
	cd build
	msg 'Running cmake...'
	cmake .. \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_SKIP_RPATH=ON \
	  -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

	  msg 'Running make...'
	make -j$(_optimal_make_jobs) ||return 1
}

package() {
	cd "$srcdir/admiral0-$pkgname-$_gitcommit/build"

	make DESTDIR="$pkgdir" install
}
