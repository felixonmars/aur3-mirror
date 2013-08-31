#This is an old Deviant Dark theme for gtk2
# Maintainer: Your Name <huysagan@gmail.com>
pkgname=deviantdark
pkgver=0.1
pkgrel=1
pkgdesc="gtk-theme murrine-engine based on Mire v2-lime by Lyrae"
arch=('any')
url="http://gnome-look.org/content/show.php/deviant+Dark?content=69496"
license=('GPL')
source=("http://gnome-look.org/content/download.php?content=69496&id=1&tan=27047386")
md5sums=('e56b2db9567b1992896c383021f84342') #generate with 'makepkg -g'

package() {
        mkdir -p "$pkgdir/usr/share/themes"
	cp  -dpr --no-preserve=ownership "$srcdir/deviant_dark/" "$pkdir/usr/share/themes/"
        find "$pkgdir" -type d -exec chmod 755 "{}" \;
        find "$pkgdir" -type f -exec chmod 644 "{}" \;
}
