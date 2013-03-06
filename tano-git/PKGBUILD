pkgname=tano-git
pkgver=20130306
pkgrel=1
pkgdesc="An open-source cross-platform IP TV player based on Qt and libvlc"
arch=('i686' 'x86_64')
url="http://projects.tano.si/en/player"
license=('GPL')
depends=('vlc' 'qt>=4.8' 'libvlc-qt-git')
makedepends=('cmake>=2.8')
provides=('tano')
conflicts=('tano')

_gitroot='git://github.com/ntadej/tano.git'
_gitname='tano'
_buildir="$_gitname-build"

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
	cd "$srcdir"

	msg 'Connecting to GIT server...'
	if [ -d "$_gitname" ]; then
		cd "$_gitname" && git pull origin
		cd ..
	else
		git clone "$_gitroot"
	fi
	msg 'GIT checkout done or server timeout.'

	if [ -d "$_buildir" ]; then
		msg 'Cleaning previous build...'
		rm -rf "$_buildir"
	fi

	git clone "$_gitname" "$_buildir"
	cd "$_buildir"

	msg 'Running cmake...'
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDEFAULT_DATA_DIR=/usr/share/tano -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4

	msg 'Running make...'
	make -j$(_optimal_make_jobs)
}

package() {
	cd "$srcdir/$_buildir"
	make DESTDIR="$pkgdir" install
	install -Dm 644 tano.desktop "$pkgdir/usr/share/applications/tano.desktop"
}
