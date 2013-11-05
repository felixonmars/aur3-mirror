
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=statverif
realpkgname=proverif
pkgver=1.86pl4
pkgrel=2
pkgdesc="automatic cryptographic protocol verifier - a patched proverif"
arch=('i686' 'x86_64')
url="http://markryan.eu/research/statverif/"
license=('GPL')
makedepends=('ocaml' 'sed')
source=("http://prosecco.gforge.inria.fr/personal/bblanche/proverif/$realpkgname$pkgver.tar.gz" 'http://markryan.eu/research/statverif/files/proverif-1.86pl4-statverif-2657ab4.patch')
md5sums=('d12312f2a4fcf5f332e9dda57ab5e99c'
         'dcde77b43c305a4fa92553f4ba3c979f')
sha1sums=('f816b62a81e47c321642b06f8434dcd23ceb65eb'
          '08605a5363610996b99b6ca3fe38949d6dbe0c8e')
sha256sums=('7184577088d7fc2dd1f52124d98f93914d5231401c01d59194c41cdd236b7b98'
            '7cd5ce819512d87cf4fc1a219185df476f6469520ef155f57a8f4d1c22947284')

prepare() {
	cd "$srcdir/$realpkgname$pkgver"
	patch -p 1 < $srcdir/proverif-1.86pl4-statverif-2657ab4.patch
}

build() {
	cd "$srcdir/$realpkgname$pkgver"
	./build
}

# test is possible, but takes *LONG* time...
# it just runs proverif on a lot of protocols, and takes *LOTS* of time...
#check() {
#	cd "$srcdir/$pkgname$pkgver"
#	./test all
#}

package() {
	cd "$srcdir/$realpkgname$pkgver"
	mkdir -p $pkgdir/usr/{bin,share/doc/statverif/tests}
	# rename executable -- do not conflict with proverif
	cp proverif $pkgdir/usr/bin/statverif
	cp proveriftotex $pkgdir/usr/bin/statveriftotex

	cp -a docs/* emacs examples test test-type cryptoverif.pvl README LICENSE CHANGES spassconvert $pkgdir/usr/share/doc/statverif/

	# make the examples work again. the executable is not in the docs directory
	# plus, the executable is renamed not to conflict with proverif
	sed -i 's/\.\/proverif/statverif/' $pkgdir/usr/share/doc/statverif/test
	sed -i 's/\.\/proverif/statverif/' $pkgdir/usr/share/doc/statverif/test-type
	sed -i 's/\.\/proverif/statverif/' $pkgdir/usr/share/doc/statverif/spassconvert	

}


