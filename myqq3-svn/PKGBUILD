pkgname=myqq3-svn
pkgver=13
pkgrel=1
arch=('i686' 'x86_64')
url="http://code.google.com/p/myqq3/"
pkgdesc="A portable open source qq CLI clien"
license=('GPLv3')
makedepends=('glibc')

_svntrunk=http://myqq3.googlecode.com/svn/trunk/
_svnmod=myqq3

build() {
	cd $srcdir/
	msg "Getting source..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn --config-dir ../ up -r $pkgver && cd ..)
	else
		svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build

	msg "Starting make..."
	cd $_svnmod-build
	make -C src -flinux.mak CC="${CHOST}-gcc" \
	CFLAGS="${CFLAGS} -c -Wall" LDFLAGS="${LDFLAGS} -lpthread" \
	LD="${CHOST}-gcc"
}

package(){
	cd $_svnmod-build
#	make DESTDIR="$pkgdir" install
	mkdir -p $pkgdir/usr/bin
	cp myqq $pkgdir/usr/bin
}