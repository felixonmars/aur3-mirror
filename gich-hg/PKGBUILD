# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=gich-hg
pkgver=20110614
pkgrel=2
pkgdesc="A cross platform which utility written in Go."
arch=('i686' 'x86_64')
license=('BSD')
url="https://bitbucket.org/jpoirier/gich"
depends=('go')
makedepends=('mercurial')


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d gich ]; then
		cd gich
		hg pull -u
		cd $srcdir
	else
		hg clone https://bitbucket.org/jpoirier/gich
	fi
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/gich $srcdir/build
}

package() {
  cd $srcdir/build/
  make
  install -Dm755 $srcdir/build/gich $pkgdir/usr/bin/gich
  install -Dm644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}