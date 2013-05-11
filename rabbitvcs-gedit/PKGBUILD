# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Alessandro Nakamuta <alessandro.ufms@gmail.com>

pkgname=rabbitvcs-gedit
pkgver=0.15.3
pkgrel=1
pkgdesc="Gedit front-end for RabbitVCS"
arch=('i686' 'x86_64')
url="http://rabbitvcs.org/"
#install=$pkgname.install
depends=('gedit' 'rabbitvcs')
license=('GPL')
_svnroot="http://rabbitvcs.googlecode.com/svn/tags/v${pkgver}"
source=()
md5sums=()

package(){
	_dest="$pkgdir/usr/lib/gedit/plugins"
	mkdir -p "$_dest"
	cd $_dest
	curl "$_svnroot/clients/gedit/rabbitvcs-plugin.py" -s -o rabbitvcs-plugin.py
	curl "$_svnroot/clients/gedit/rabbitvcs-gedit3.plugin" -s -o rabbitvcs.plugin
}
