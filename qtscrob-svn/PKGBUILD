# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=qtscrob-svn
pkgver=79
pkgrel=1
pkgdesc="A tool to upload information about the tracks you have played from your Digital Audio Player (DAP) to your last.fm account. Supports Apple iPods or DAPs running the Rockbox replacement firmware."
arch=("i686" "x86_64")
url="http://qtscrob.sourceforge.net/"
license=("GPL")
depends=('qt4>=4.3' 'curl')
makedepends=()
provides=(qtscrob)
conflicts=(qtscrob)
install=
source=()
md5sums=()

_svntrunk=https://qtscrob.svn.sourceforge.net/svnroot/qtscrob/trunk
_svnmod=qtscrob

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	cd src
	mkdir -p $startdir/pkg/usr/bin
	cd cli
	make || return 1
	install -m755 scrobble-cli $startdir/pkg/usr/bin/
	cd ../qt
	qmake || return 1
	make || return 1
	install -m755 qtscrob $startdir/pkg/usr/bin/
}
# vim: ts=2
