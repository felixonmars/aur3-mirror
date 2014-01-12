# Maintainer:  Shaw <puxx@mail.ustc.edu.cn>

pkgname=gtk-theme-vimix
pkgver=3.0
pkgrel=1
pkgdesc="Vimix Flat Themes for gtk2, gtk3, metacity, openbox, xfwm4 and unity"
arch=('any')
url="http://gnome-look.org/content/show.php/Vimix?content=162783"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source=(http://gnome-look.org/CONTENT/content-files/162783-Vimix%20Flat%20Themes.tar.gz)
md5sums=('86870f55ae7ea96e2034e49b00a287a1')

package() {
	cd "${srcdir}/"
	find Vimix{,*} -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;
}

