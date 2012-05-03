# Contributor: snuo
pkgname=parallelize
pkgver=1.0
pkgrel=2
pkgdesc="A shell utility to execute command batches in parallel."
arch=('i686' 'x86_64')
url="http://www.marco.org/36737831"
license=('public-domain')
source=("morehelp.patch" "http://articles.marco.org/images/parallelize.c")
md5sums=('acd25edad0c03116a3bc0b607ee49fe8'
         '1f686e6b6bedbfbed10c52acfdbc0ee3')
sha1sums=('21f9e3a48e0b5fe21cfb4b0d8679f92533d01f44'
          '4ef6d427653826c53efb75369bf32e4b211b748d')

build() {
	cd "$srcdir"
	patch -i morehelp.patch
	gcc -pthread parallelize.c -o parallelize || return 1
	install -m755 -d $pkgdir/usr/bin
	cp parallelize $pkgdir/usr/bin	
}