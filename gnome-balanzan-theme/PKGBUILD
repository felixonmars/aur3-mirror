# Contributor: Fabio Volpe <volpefabio@gmail.com>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gnome-balanzan-theme
pkgver=1.8.1
pkgrel=1
pkgdesc="This is the new version of the ubuntu colors theme."
arch=('any')
depends=('gtk-engines' 'gtk-engine-murrine')
url="http://www.bisigi-project.org/?p=28&lang=en"
license=('GPL')
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/balanzan-theme_1.8.1.natty.ppa1.tar.gz)
md5sums=('3501004470198f5bfc698b1681b697f3')

package () {
  # Gtk theme
  cd "$srcdir/balanzan-theme/Gtk"
  mkdir -p $pkgdir/usr/share/themes
  tar xfz balanzan.tar.gz -C $pkgdir/usr/share/themes
  # Icons theme
  cd "$srcdir/balanzan-theme/Icons"
  mkdir -p $pkgdir/usr/share/icons
  tar xfj balanzan.tar.bz2 -C $pkgdir/usr/share/icons
  # Wallpapers
  cd "$srcdir/balanzan-theme/Wallpaper"
  mkdir -p $pkgdir/usr/share/backgrounds
  cp *.png $pkgdir/usr/share/backgrounds
  # License
  cd "$srcdir/balanzan-theme"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname"
}

build () {
	cd $srcdir
}
