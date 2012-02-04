# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
pkgname=permz
pkgver=1.0.1
pkgrel=1
pkgdesc="Presents a GUI menu for quickly changing file permissions/ownership"
PACKAGER="IgnorantGuru <ignorantguru@users.sourceforge.net>"
arch=(any)
depends=('zenity' 'gksu')
optdepends=('sudo')
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh")
md5sums=('fbab19b05d761ebb26038eaebdc9c744')

build() {
	cd ${startdir}/pkg || return 1
	mkdir -p usr/bin || return 1
	cd usr/bin || return 1
	cp ${startdir}/$pkgname.sh ./$pkgname
	chmod +x $pkgname
}

