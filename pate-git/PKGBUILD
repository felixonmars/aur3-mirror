# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=pate-git
pkgver=20121025
pkgrel=1
pkgdesc="Plugin for Kate that allows you to create new plugins in Python for Kate."
arch=(i686 x86_64)
url="http://kate-editor.org/2012/07/01/python-plugin-developer-guide-part-1/"
license=('GPL')
depends=('kdesdk-kate' 'kdebindings-python2')
makedepends=('git' 'python2-sip')

_gitroot="git://anongit.kde.org/kate"
_gitname="kate"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd $_gitname
	fi
	git checkout KDE/4.9
	git checkout master -- kate/plugins/pate

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cat <<EOF > kate/plugins/CMakeLists.txt
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../..)

remove_definitions ( -DKDE_DEFAULT_DEBUG_AREA=13001 )
add_definitions ( -DKDE_DEFAULT_DEBUG_AREA=13040 )

remove_definitions(-DQT3_SUPPORT)

add_subdirectory( pate )
EOF

	cd "$srcdir"
	rm -rf build
	mkdir build
	cd build

	cmake ../kate -DPYTHON_EXECUTABLE=/usr/bin/python2 -DCMAKE_INSTALL_PREFIX=/usr
	cd kate/plugins/pate
	make
}

package() {
	cd "$srcdir/build/kate/plugins/pate"
	install -m 755 -d "$pkgdir/usr/share/apps/kate"
# 	cp -rv . "$pkgdir/usr/share/apps/kate/"
	make DESTDIR="$pkgdir/" install
}
