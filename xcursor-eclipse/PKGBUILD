# Contributor: renodesper <renodesper@fedoraproject.org>
# Maintainer: renodesper <renodesper@fedoraproject.org>

pkgname=xcursor-eclipse
_pkgname=Eclipse
pkgver=20091125
pkgrel=1
pkgdesc="Eclipse cursor theme"
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php/Eclipse?content=106210"
license=('GPL')
depends=()
source=("http://gnome-look.org/CONTENT/content-files/106210-$_pkgname.tar.gz")
md5sums=('7ce98274e8a24643ed3e39ff12c88d65')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"

}
