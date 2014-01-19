# submitter: perlawk
# Maintainer: perlawk

pkgname=rscheme
_pkgname=rs
pkgver=0.7.3.4
_pkgver=b7
pkgrel=1
pkgdesc="RScheme is an open-source (and freely redistributable) implementation of the Scheme language with lots of extensions and additional features beyond the core language)"
url="http://www.rscheme.org/rs/index.html"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
options=('staticlibs' !strip)
source=("http://www.rscheme.org/rs/b/0.7.3.4/7/rs-0.7.3.4-b7.tar.gz"
rs.1 rsc.1 fshell.1
)
 
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${_pkgver}"
	make stage1
	cd src
	./configure --prefix=/usr
  make -j4
}
 
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${_pkgver}"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/lib/rscheme"
	cp stage0/rshell/rs src/tmp/rsc "$pkgdir/usr/bin"
	cp -a stage0/install/include "$pkgdir/usr"
	cp -a stage0/install/lib "$pkgdir/usr/lib/rscheme"
	cp -a stage0/install/resource "$pkgdir/usr/lib/rscheme"
	rm -f "$pkgdir/usr/lib/rscheme/resource/system.img"
	cp stage0/system.img "$pkgdir/usr/lib/rscheme/resource"
	cp src/tmp/rsc.img "$pkgdir/usr/lib/rscheme/resource/compiler"
	cp -a src/install/resource/modules "$pkgdir/usr/lib/rscheme/resource"
	cp "$srcdir"/*.1 "$pkgdir/usr/share/man/man1"

}
md5sums=('398f5cdeb314a6c8303ada6faa611aef'
         '339bd4802e1b87b079eaaa0c9b5ccc59'
         '7d491edabd54fb82e49040d0228adb01'
         'ab4c0f2b28626d5cf5f9cd6ef230d090')
