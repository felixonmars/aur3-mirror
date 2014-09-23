# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: sxe <sxxe@gmx.de>

pkgname=qupzilla-plugins-git
pkgver=20140919
pkgrel=1
pkgdesc="A new and very fast open source browser based on WebKit core, written in Qt Framework. With additional plugins."
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=( 'qt4' 'qtwebkit' 'hunspell') # 'kdelibs' 'gnome-keyring'
makedepends=('git')
provides=('qupzilla' 'qupzilla-git')
conflicts=('qupzilla' 'qupzilla-git')
replaces=('qupzilla' 'qupzilla-git')
source=('git://github.com/QupZilla/qupzilla.git'
        'git://github.com/QupZilla/qupzilla-plugins.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/qupzilla"

	git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

build() {
	cd "$srcdir/qupzilla"

	export USE_WEBGL="true"
	export KDE="true"
	export QUPZILLA_SRCDIR="$PWD"
	export QUPZILLA_PLUGINS_SRCDIR="$srcdir/qupzilla-plugins/plugins"
	export USE_LIBPATH="/usr/lib"

	qmake-qt4
	make
}

package() {
	cd "$srcdir/qupzilla"

	make INSTALL_ROOT="$pkgdir/" install
}
