pkgname=oxygen-gtk-icons
pkgver=0.1
pkgrel=2
pkgdesc="Gtk icon theme that makes gtk app integrate into kde, fork of oxygen refit 2"
url="http://sourceforge.net/projects/chakra/files/Tools/Oxygen-Gtk-Icons/"
arch=(any)
license=('LGPL3')
source=("http://sourceforge.net/projects/chakra/files/Tools/Oxygen-Gtk-Icons/oxygen-gtk-${pkgver}.tar.gz")
md5sums=('2690c3be8243af48d6bf10f7615c7bc0')

package()
{
    cd "$srcdir"
    install -d "$pkgdir/usr/share/icons/oxygen-gtk"
    cp -rf oxygen-gtk-${pkgver}/* "$pkgdir/usr/share/icons/oxygen-gtk"
    find -type f -print0 | xargs -0 chmod 644
}
