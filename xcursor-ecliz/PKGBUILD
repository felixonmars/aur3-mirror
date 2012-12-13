# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Maintainer: Chirantan EKbote <chirantan.ekbote at gmail.com>

pkgname=xcursor-ecliz
_pkgname=Ecliz
pkgver=1.0
pkgrel=1
pkgdesc="Ecliz cursor theme"
arch=(i686 x86_64)
url="http://gnome-look.org/content/show.php/Ecliz?content=110340"
license=('GPL')
depends=()
source=("http://gnome-look.org/CONTENT/content-files/110340-$_pkgname.tar.gz")
md5sums=('524e7ce61e8849ea0a1a29dac5ea25fc')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"

}

