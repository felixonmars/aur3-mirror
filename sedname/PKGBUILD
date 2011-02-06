# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
pkgname=sedname
pkgver=1.0.1
pkgrel=1
pkgdesc="Batch-renames files using a sed script"
arch=(any)
depends=()
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh | md5sum | head -c 32`)
md5sums=('1e67c57ad75f9d94763379d66210f116')

build() {
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

