# Contributor:		osily <ly50247@gmail.com>
pkgname=blue_boom-gdm-theme
_realname=Blue_Boom
pkgver=1.0
_id=114484
pkgrel=1
pkgdesc="A Blue_Boom theme for gdm<2.8."
arch=('any')
url="http://gnome-look.org/content/show.php/Blue+Boom+GDM?content=114484"
license=('GPL')
depends=('gdm-old')
source=("http://gnome-look.org/CONTENT/content-files/$_id-$_realname.tar.gz")
build() {
cd "${srcdir}/${_realname}"
install -d "${pkgdir}/usr/share/gdm/themes/"
cp -r "${srcdir}/${_realname}/" "${pkgdir}/usr/share/gdm/themes/"
}
md5sums=('8b08fb6786f8df4d127ac75b98d7baa3')
