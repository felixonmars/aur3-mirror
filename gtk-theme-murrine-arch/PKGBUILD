# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
 
pkgname=gtk-theme-murrine-arch
pkgver=0.4
pkgrel=2
pkgdesc="Arch dedicated GTK theme for Murrine engine"
arch=(any)
url="http://gnome-look.org/content/show.php/Murrine+Arch?content=96308"
license=(GPL)
depends=(gtk-engine-murrine)
source=(http://gnome-look.org/CONTENT/content-files/96308-murrine-arch-gtk-$pkgver.tar.gz)
md5sums=('b0f13203f1769817becc2aa0a7fa9525')
package () {
        mkdir -p $pkgdir/usr/share/themes
        cp -R $srcdir/Arch* $pkgdir/usr/share/themes
}
