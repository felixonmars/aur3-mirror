# Mantainer: supernbo at gmail dot com <supernbo@gmail.com>

pkgname=gtk-theme-libra
pkgver=1.1
pkgrel=1
pkgdesc="A light modern theme derived from Flattastic-Blue"
arch=('any')
url="http://gnome-look.org/content/show.php/Libra?content=167689"
source=("http://gnome-look.org/CONTENT/content-files/167689-Libra1.1.tar.gz")
license=('GPL')
md5sums=('e4633ee3026e2f645a1b5cb8f0c03633')

package() {
    mkdir -p $pkgdir/usr/share/themes/
    cp -r $srcdir/Libra $pkgdir/usr/share/themes/
    cd $pkgdir/usr/share/themes/Libra
    chmod -R 0644 *
    chmod 0755 $(find . -type d) 
}
