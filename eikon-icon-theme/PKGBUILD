# Maintainer: yuginta <cowoplinplan@gmail.com>

pkgname=eikon-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="This is Eikon icon theme."
arch=('any')
url="http://www.maknyos.com/"
license=('GPLv2')
depends=('gtk2' 'hicolor-icon-theme')
source=(http://dl2.users.maknyos.com/files/0/yq9sl1s2ezqk23/Eikon-maknyos.com.zip)
md5sums=('54a4c06514754c2a0def79a84aaa4cda')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/icons/
	cp -r "Eikon" $startdir/pkg/usr/share/icons/
}
