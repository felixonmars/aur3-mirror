# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
pkgname=mountiso
pkgver=1.0.1
pkgrel=1
pkgdesc="Sets up and performs mounting of ISO files by non-root user"
arch=(any)
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname-$pkgver.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname-$pkgver.sh | md5sum | head -c 32`)
md5sums=('80496f59b399f52a1c32325f5c3ddf1b')
sha256sums=('66ac6e0a65e39388f774616e32225cb52fe41e662672ad6283c31279fa872df8')

build() {
	install -Dm755 "$srcdir/$pkgname-$pkgver.sh" "$pkgdir/usr/bin/$pkgname"
}

