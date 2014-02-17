# Maintainer:  Francisco Martínez <fr0z3d AT outlook DOT com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Chirantan EKbote <chirantan.ekbote at gmail.com>

pkgname=xcursor-windows-8
_pkgname=win8
pkgver=1.01
pkgrel=1
pkgdesc="Windows 8 cursor theme"
arch=(any)
url="http://gnome-look.org/content/show.php/Windows+8+cursors?content=155025"
license=('GPL')
depends=()
source=("http://gnome-look.org/CONTENT/content-files/155025-$_pkgname.tar.gz")
md5sums=('fb0aa8acae986cc59c8d9d33ff46c6dd')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"
}

