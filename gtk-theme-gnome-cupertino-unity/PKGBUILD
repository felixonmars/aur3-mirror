# Maintainer: tanuva <tanuva aet nightsoul d00t org>

# Maintainer: tanuva <tanuva aet nightsoul d00t org>
# Contributor: qwer1234
pkgname='gtk-theme-gnome-cupertino-unity'
pkgver=2.1.1
pkgrel=1
pkgdesc="Gnome Cupertino GTK3 theme for Unity"
arch=(any)
url="http://gnome-look.org/content/show.php?content=147061"
license=('GPL')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
conflicts=('gtk-theme-adwaita-cupertino' 'gtk-theme-adwaita-cupertino-glassy')
source=('http://gnome-look.org/CONTENT/content-files/147061-Gnome-Cupertino-2.1.1.tar.gz')
install=gtk-theme-gnome-cupertino-unity.install

package() {
 	bsdtar -xf ${srcdir}/147061-Gnome-Cupertino-2.1.1.tar.gz
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R ${srcdir}/Gnome-Cupertino-unity ${pkgdir}/usr/share/themes/
	cd ${pkgdir}/usr/share/themes/
	find . -type f -exec chmod 644 {} \;
	find . -type d -exec chmod 755 {} \;
}

md5sums=('8fa1e5c4b27e6283125237bcab68feed')

