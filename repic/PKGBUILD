# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
pkgname=repic
pkgver=1.1.1
pkgrel=1
pkgdesc="Batch resizes and rotates JPEGs; creates Claws or KMail email with attached images"
PACKAGER="IgnorantGuru <ignorantguru@users.sourceforge.net>"
arch=(any)
depends=('imagemagick' 'jhead' 'zenity')
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh | md5sum | head -c 32`)
md5sums=('475850d111b9dcec41f397434e514978')
sha256sums=('b1141d7cdedb6280da0ac419f587649d7c17e124f4769d424d8f706bdcc3c057')

build() {
	cd ${startdir}/pkg || return 1
	mkdir -p usr/bin || return 1
	cd usr/bin || return 1
	cp ${startdir}/$pkgname.sh ./$pkgname || return 1
	chmod +x $pkgname
}
