# Submitter : perlawk
pkgname=aclint
_pkgname=acl
pkgver=1.2
pkgrel=1
pkgdesc='acl: Generalized Combinatory Logic Interpreter'
url='http://stratigery.com/acl.html'
license=('GPL')
arch=('i686' 'x86_64')
options=(!strip)
source=("http://stratigery.com/$_pkgname/$_pkgname-$pkgver.tar.gz")

build() {
		cd "$srcdir"/"$_pkgname-$pkgver"
    make gnu
}

package() {
		cd "$srcdir"/"$_pkgname-$pkgver"
		mkdir -p "$pkgdir"/usr/bin
		cp "$_pkgname" "$pkgdir"/usr/bin
}

md5sums=('3d5798a5e7901481d78a64fc30b02e56')
