pkgname=gnome-shell-theme-ice-cream-sandwich
pkgver=20120120
pkgrel=1
pkgdesc="A GNOME Shell theme from tiheum, the Faenza icon set creator."
url="http://tiheum.deviantart.com/art/Gnome-Shell-Ice-Crean-Sandwich-280076980"
license=('GPL3')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: Easy theme switcher')
source=('http://www.deviantart.com/download/280076980/gnome_shell___ice_crean_sandwich_by_tiheum-d4mr0s4.zip')
md5sums=('f7117c1db82c2632d0e05c5d999a8d0b')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/themes
    mv "Ice Cream Sandwich" $pkgdir/usr/share/themes/
}
