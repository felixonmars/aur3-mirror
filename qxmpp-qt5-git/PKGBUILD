pkgname=qxmpp-qt5-git
_gitname=qxmpp
_buildir="$_gitname-build"
pkgver=v0.8.0.26.gb54ccca
pkgrel=1
pkgdesc="A cross-platform C++ XMPP client library based on Qt"
arch=('i686' 'x86_64')
url="https://code.google.com/p/qxmpp/"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
conflicts=('qxmpp qxmpp-git')
source=('git+https://github.com/qxmpp-project/qxmpp.git')

md5sums=('SKIP')

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

pkgver() {
	cd $_gitname
	# Use the tag of the last commit
	git describe --always | sed 's|-|.|g'
}

build() {
	#cd $_gitname
	cd $srcdir/$_gitname

	msg 'Configuring for skipping tests and examples...'
	sed -i '/tests/d' qxmpp.pro
	sed -i '/examples/d' qxmpp.pro

	msg 'Running qmake...'
	qmake PREFIX=/usr

	msg 'Running make...'
	make -j$(_optimal_make_jobs)
}

package() {
	cd "$srcdir/$_gitname/src"
	make INSTALL_ROOT="$pkgdir" install
	rm -rf "$srcdir/$_buildir"
}
