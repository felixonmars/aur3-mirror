# Maintainer: Austin <doorknob60 at gmail dot com>

pkgname=dbox
pkgver=2.3
pkgrel=2
pkgdesc="An easy to use and powerful frontend for Dosbox written in Java"
arch=(any)
url="http://code.google.com/p/dbox/"
license=('GPL')
groups=('emulators')
depends=('java-runtime' 'dosbox')
source=('http://dbox.googlecode.com/files/dbox23.zip' 'dbox.desktop' 'http://dbox.googlecode.com/svn/DBox2/src/no/truben/dbox/img/ikon.gif' 'dbox')
md5sums=('00c265982e74a093ac317ea0a75a4f48' '588e848751e65aae9fa672167415504f' 'a6f3b3a0c30cdda5d7548f47f78441af' '600c223beca7f61b11222a251991ce69')

package() {
install -d $pkgdir/usr/bin
install -d $pkgdir/usr/share/pixmaps
install -d $pkgdir/usr/share/java/dbox
install -d $pkgdir/usr/share/applications
install -D DBox2.jar $pkgdir/usr/share/java/dbox
install -D dbox.desktop $pkgdir/usr/share/applications/
install -T ikon.gif $pkgdir/usr/share/pixmaps/dbox.gif
install -Dm755 dbox $pkgdir/usr/bin
cp -R ./lib $pkgdir/usr/share/java/dbox
}
