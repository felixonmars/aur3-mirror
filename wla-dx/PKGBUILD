pkgname=wla-dx
pkgver=20140411
pkgrel=1
pkgdesc="A multiplatform cross assembler."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/vhelin/wla-dx"
options=(!ccache)

source=("git+https://github.com/vhelin/wla-dx")
md5sums=('SKIP')

build() {
  cd "$srcdir/wla-dx"
  CFLAGS="-c -ansi $CFLAGS" ./unix.sh 4
}
package () {
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/wla-dx/binaries/* "$pkgdir/usr/bin"
}
