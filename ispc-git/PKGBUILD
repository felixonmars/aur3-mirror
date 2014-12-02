pkgname=ispc-git
_pkgname=ispc
pkgver=r2710.d18b85f
pkgrel=1
pkgdesc='Intel SPMD Program Compiler'
arch=('any')
url="https://ispc.github.io/"
license=('custom')
depends=('llvm' 'clang')
makedepends=('git' 'flex' 'bison' 'python2' 'python-docutils')
provides=('ispc')
conflicts=('ispc')

source=('ispc::git+https://github.com/ispc/ispc.git')

md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	find -name '*.py' -print -exec sed -i.bak 's/python/python2/g' {} \;
	sed -i.bak 's/python/python2/g' Makefile
	make
	cd docs
	./build.sh
}


package() {
	cd $srcdir/$_pkgname
	install -D -m755 ispc $pkgdir/usr/bin/ispc
  	install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE
	install -d -m755 $pkgdir/usr/share/doc/$_pkgname
	cd docs
	install -D -m644 *.html $pkgdir/usr/share/doc/$_pkgname
}
