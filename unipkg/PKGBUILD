# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>
pkgname='unipkg'
pkgver=1
pkgrel=1
pkgdesc="Unipkg: a makepkg fork that can also compile to other package formats like deb and rpm(eventually). Use it like: unipkg -P deb"
arch=('any')
url="http://bauer.dnsdojo.com/Projects/$pkgdir"
license=('GPL')
source=('unipkg')
depends=('bash')
md5sums=('4c607dca872ab48e0616def4f20e2986')

build() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/unipkg $pkgdir/usr/bin
}
