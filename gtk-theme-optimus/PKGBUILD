# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Jonathan Conder <jonno dot conder at gmail dot com>

pkgname=gtk-theme-optimus
pkgver=1.1
pkgrel=1
pkgdesc='Optimal GTK+ and Metacity theme'
arch=('any')
license=('GPL')
url='http://www.gnome-look.org/content/show.php?content=132391'
depends=('gtk-engine-murrine')
optdepends=('gnome-colors-icon-theme: matching icons'
            'xcursor-vanilla-dmz: matching cursor')
source=('http://gnome-look.org/CONTENT/content-files/132391-optimus.tar.xz')
sha256sums=('98f56f8b5e6ed1150a6b91224d299b13b5faf5e60f9c50a08596b4abeceb17fa')

package() {
	mkdir -p "${pkgdir}/usr/share/themes"
	cp -r "${srcdir}/Optimus" "${pkgdir}/usr/share/themes/"
}
