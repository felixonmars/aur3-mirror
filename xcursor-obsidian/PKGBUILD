# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="xcursor-obsidian"
pkgver="1.0"
pkgrel="3"
pkgdesc="Obsidian cursor theme"
arch=("any")
url="http://www.gnome-look.org/content/show.php/Obsidian+Cursors?content=73135"
license=("GPL")
source=("http://www.gnome-look.org/CONTENT/content-files/73135-Obsidian.tar.bz2")
md5sums=("bfac15c02e4a7a7c7e0225a86a4c9bfc")

package() {
  mkdir -p "$pkgdir/usr/share/icons/Obsidian"
  cp -R "$srcdir/Obsidian"/{cursors,index.theme} "$pkgdir/usr/share/icons/Obsidian"
}
