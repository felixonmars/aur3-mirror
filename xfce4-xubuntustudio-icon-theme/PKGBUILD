# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=xfce4-xubuntustudio-icon-theme
pkgver=0
pkgrel=3
pkgdesc="XubuntuStudio icon theme for XFCE"
arch=('any')
url="http://xfce-look.org/content/show.php/XubuntuStudio+Icons?content=65775"
license=('GPL')
depends=('tango-icon-theme')
source=('http://www.fileden.com/files/2008/12/27/2240700/XubuntuStudio.tar.gz')
md5sums=('86573f84c78f6ca3590c73e4aecf78f3')

package() {
 mkdir -p "$pkgdir/usr/share/icons"
 cp -R "$srcdir/XubuntuStudio" "$pkgdir/usr/share/icons"
}
