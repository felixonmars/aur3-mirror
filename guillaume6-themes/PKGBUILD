# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
pkgname=guillaume6-themes
pkgver=0.1
pkgrel=2
pkgdesc="A themes pack for Xfce and Gnome, based on guillaume6@freenode/#archlinux-fr choices"
arch=(any)
license=('unknown')
url=('http://koon.fr/')
source=(http://www.xfce-look.org/CONTENT/content-files/79592-GT-Graphite_v0.1.tar.gz
        http://www.xfce-look.org/CONTENT/content-files/75276-Tigris-Globalmenu.tar.gz
        http://gnome-look.org/CONTENT/content-files/75528-Tigris-Normal.tar.gz
        http://www.xfce-look.org/CONTENT/content-files/77747-Moomex-Ultimatum.tar.gz)
md5sums=('e587d8ce3ce46e505a06dd49ddf4745f'
         'c4eaceb9d1e9bd83f5c911c505ac2145'
         '54e90dd423638070815aff2e84f9531c'
         '387013c3c1f0e032496dcd8de53bb2a9')
build() {
	install -d "$pkgdir/usr/share/themes"
	cp -r "$srcdir"/{GT-Graphite_v0.1,Moomex-Ultimatum,Tigris-Normal,Tigris-Globalmenu} "$pkgdir/usr/share/themes"
}
