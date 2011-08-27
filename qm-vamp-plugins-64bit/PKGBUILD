# Maintainer: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: moi

pkgname=qm-vamp-plugins-64bit
pkgver=1.6.1
pkgrel=1
pkgdesc="Queen Mary Vamp Plugins"
arch=('x86_64')
url="http://isophonics.net/QMVampPlugins"
license=('GPL')
depends=('vamp-plugin-sdk')

source=('http://isophonics.net/files/qm-vamp-plugins-1.6.1-amd64-linux.tar.gz')
md5sums=('7d00328f571b4fea1fda3b163e03b50a')

build() {
	rm $srcdir/qm-vamp-plugins-1.6.1-amd64-linux/*.txt
	install -d $pkgdir/usr/lib/vamp/
	install -p $srcdir/qm-vamp-plugins-1.6.1-amd64-linux/* $pkgdir/usr/lib/vamp/
}
