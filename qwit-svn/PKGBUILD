# Contributor: Jan-Erik Rediger <badboy@archlinux.us>
# Contributor: Nezmer <me@nezmer.info>
# Contributor: Vzlom <gvzlom@gmail.com>
pkgname=qwit-svn
pkgver=353
pkgrel=1
pkgdesc="Qt4 cross-platform client for Twitter (SVN snapshots)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwit/"
license=('GPL3')
depends=('qt' 'qoauth' 'qca-ossl')
makedepends=('subversion')
provides=('qwit')
conflicts=('qwit')
replaces=('qwit')
source=()
md5sums=()

_svntrunk=http://qwit.googlecode.com/svn/trunk
_svnmod=qwit-read-only

build() {
	cd "$srcdir"
	if [ -d $_svnmod/.svn ]; then
					(cd $_svnmod && svn up -r $pkgver)
	else
					svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$_svnmod-build"
	mkdir "$_svnmod-build"
	cp -r $_svnmod "$_svnmod-build"
	cd "$_svnmod-build/$_svnmod"
	# Disable remembering position
	sed -i 's|config->position = pos()|//config->position = pos()|' src/MainWindow.cpp
	qmake PREFIX=/usr || return 1
	make || return 1
	make INSTALL_ROOT="$pkgdir" install
}
