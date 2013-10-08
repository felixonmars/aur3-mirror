#Maintainer: dongfengweixiao <dongfengweixiao at googlemail dot com>

pkgname=xcursor-softsteel
pkgver=2013.10.08
pkgrel=1
pkgdesc="A cursor theme."
arch=(i686 x86_64)
url=("http://grynays.deviantart.com/art/SoftSteel-178133076")
license=('GPL')
depends=()
source=("https://gthemes-china.googlecode.com/files/SoftSteel-small.tar.gz"
	"https://gthemes-china.googlecode.com/files/SoftSteel.tar.gz")
md5sums=('15b3eb6e9fe1699462cee353ec0bcf54'
         'f56d903c28e326f932ef109478d1291f')

name=SoftSteel
package() {
	mkdir -p ${pkgdir}/usr/share/icons/$name/cursors
	mkdir -p ${pkgdir}/usr/share/icons/$name-small/cursors
	cp $name/*.theme ${pkgdir}/usr/share/icons/$name
	cp $name/cursors/* ${pkgdir}/usr/share/icons/$name/cursors
	cp $name-small/*.theme ${pkgdir}/usr/share/icons/$name-small
	cp $name-small/cursors/* ${pkgdir}/usr/share/icons/$name-small/cursors
}

