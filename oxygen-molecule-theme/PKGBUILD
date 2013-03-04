# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=oxygen-molecule-theme
pkgver=3.2
pkgrel=2
pkgdesc="Oxygen-Molecule KDE & GTK+ unified theme"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Oxygen-Molecule+KDE+%26+GTK%2B+unified+theme?content=103741"
license=('GPL')
depends=('gtk2' 'qt4' 'oxygen-icons')
source=("http://kde-look.org/CONTENT/content-files/103741-Oxygen-Molecule_${pkgver}_theme.tar.gz")
md5sums=('90e852de1ab202fa0dafb038b829846d')
install="${pkgname}.install"

_kdever=44
_colors=3.0

package() {
    # install the theme
	install -dm755 "$pkgdir/usr/share/themes"
	tar -xzf kde${_kdever}-oxygen-molecule.tar.gz -C "${pkgdir}/usr/share/themes"

    # fix permissions
    find "$pkgdir" -type f -exec chmod 644 {} \;
    find "$pkgdir" -type d -exec chmod 755 {} \;

    # install color scheme
	install -Dm644 Oxygen-Molecule_${_colors}.colors "${pkgdir}/usr/share/apps/color-schemes/Oxygen-Molecule-${_colors}.colors"

    # documentation
    install -Dm644 COPYING "$pkgdir/usr/share/doc/$pkgname/COPYING"
    install -Dm644 "Oxygen-Molecule 3.2 setup guide.pdf" "$pkgdir/usr/share/doc/$pkgname/Oxygen-Molecule-setup-guide.pdf"
}
