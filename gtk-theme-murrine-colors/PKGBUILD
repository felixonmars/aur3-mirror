# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=gtk-theme-murrine-colors
pkgver=3.0
pkgrel=1
pkgdesc="Murrine-Colors GTK+ and Metacity themes"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Murrine-Colors?content=77661"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine>=0.90.3')
source=('http://www.gnome-look.org/CONTENT/content-files/77661-Murrine-Colors-SVN.tar.gz')
md5sums=('ef485522cf5eeb349043c5d148af45bb')

package() {
    cd "${srcdir}"
    install -d -m755 "${pkgdir}/usr/share/themes"
    cp -rf Murrine* "${pkgdir}/usr/share/themes"
}
