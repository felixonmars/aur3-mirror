# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_name=win7-8
pkgname=${_name}-theme
pkgver=1.0
pkgrel=1
pkgdesc='Windows 8 gtk3 theme and Windows 7 iconset and gtk2 theme'
arch=('any')
url=('https://launchpad.net/~upubuntu-com/+archive/gtk3/+index?batch=75&memo=75&start=75'
	 'http://gnome-look.org/content/show.php/Windows+8+modern+UI+%28metro%29+GTK2%2B3?content=158721')
license=('GPL3')
depends=()
source=('http://gnome-look.org/CONTENT/content-files/158721-Windows8-gtk.tar.gz'
		'https://launchpad.net/~upubuntu-com/+archive/gtk3/+files/win2-7_0.1.tar.gz')

md5sums=('6b177c59d8a9489cd67bd0d0d516313b'
         '26e833b1ca0d858d4aebe87db88d19db')


package () {
	install -d "$pkgdir/usr/share/themes/${pkgname}/gtk-2.0"
	install -d "$pkgdir/usr/share/themes/${pkgname}/gtk-3.0"
	install -d "$pkgdir/usr/share/icons/${_name}-icons"
	cp -rv ${srcdir}/win2-7-pack/Win2-7-icons/* "$pkgdir/usr/share/icons/${_name}-icons"
	cp -rv ${srcdir}/win2-7-pack/Win2-7-theme/gtk-2.0/* "$pkgdir/usr/share/themes/${pkgname}/gtk-2.0"
	cp -rv ${srcdir}/Windows8/gtk-3.0/* "$pkgdir/usr/share/themes/${pkgname}/gtk-3.0"
}
