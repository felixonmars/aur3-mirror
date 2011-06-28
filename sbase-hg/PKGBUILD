# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
pkgname=sbase-hg
pkgver=20110624
pkgrel=2
pkgdesc="A suckless variant of the *nix core utilities"
arch=('i686' 'x86_64')
license=('MIT')
url="http://hg.suckless.org/sbase/"
makedepends=('mercurial' 'musl') #musl-git also works


build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d sbase ]; then
		cd sbase
		hg pull -u
		cd $srcdir
	else
		hg clone http://hg.suckless.org/sbase
	fi
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/sbase $srcdir/build
}

package() {
  cd $srcdir/build/
  export CC="musl-gcc"
  export CFLAGS="-Os -static"
  make DESTDIR=$pkgdir PREFIX=/opt install 
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}