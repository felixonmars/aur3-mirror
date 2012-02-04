pkgname=gtk-theme-terminal-envy
pkgver=0.9
pkgrel=1
pkgdesc="terminal theme for  high contrast  engine"
arch=('any')
url="http://gnome-look.org/content/show.php?content=114171"
license=('GPL')
depends=('gtk-engines')

source=('http://gnome-look.org/CONTENT/content-files/114171-TerminalEnvy.tar.gz')
sha1sums=('efc115923d90e6dd1224323bc1498f48dc29b816')
build () {
	mkdir -p $pkgdir/usr/share/themes/
        rm $srcdir/TerminalEnvy/gpl-3.0.txt 
	cp -r $srcdir/TerminalEnvy $pkgdir/usr/share/themes/

}
