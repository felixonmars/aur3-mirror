# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Sarmacid <aur at wedermark dot com>

pkgname=xcursor-ecliz-arch
_pkgname=Ecliz-Arch
pkgver=2.0
pkgrel=2
pkgdesc="Ecliz cursor theme in Arch colours"
arch=(i686 x86_64)
url="http://gnome-look.org/content/show.php/Ecliz?content=110340"
license=('GPL')
depends=()
source=("https://sites.google.com/site/sarmacidarch/xcursor-ecliz-arch-2.0-2-x86_64.pkg.tar.xz")
md5sums=('37335c5c8cf6ca7fc1e86034297be78a')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
		cp -r "$srcdir/usr/share/icons/$_pkgname" "$pkgdir/usr/share/icons"
		cp -r "$srcdir/usr/share/icons/$_pkgname-Small" "$pkgdir/usr/share/icons"
}
