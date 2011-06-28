# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=werc-hg
pkgver=20110614
pkgrel=2
pkgdesc="A sane web anti-framework"
arch=('any')
license=('Public Domain')
url="http://werc.cat-v.org/"
depends=('plan9port') #9base also works. For some reason "plan9" was not provided by both
makedepends=('mercurial')
source=('wercrc.patch')
md5sums=('bd90abfd8fee3bbb00c3515bdfffe341')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d werc ]; then
		cd werc
		hg pull -u
		cd $srcdir
	else
		hg clone http://hg.cat-v.org/werc
	fi
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/werc $srcdir/build
  cd $srcdir/build
  patch bin/werc.rc -i $srcdir/wercrc.patch
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/srv/http
  cp -ar build $pkgdir/srv/http/werc
}