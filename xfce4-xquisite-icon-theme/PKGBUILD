# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="xfce4-xquisite-icon-theme"
pkgver="0.4.6"
pkgrel="1"
pkgdesc="Xquisite icon theme for XFCE"
arch=("any")
url="http://xfce-look.org/content/show.php/Xquisite?content=69735"
license=("GPL")
source=("http://dl.dropbox.com/u/24716740/mirror/Xquisite.tbz")
md5sums=("e095dba18ca5ab8b46383834ab15ee14")

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -R "$srcdir/Xquisite" "$pkgdir/usr/share/icons"
	find "$pkgdir/usr/share/icons" -type f -executable -exec chmod -x {} \;
}
