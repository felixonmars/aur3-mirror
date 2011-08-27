# Contributor:		osily <ly50247@gmail.com>

pkgname=clouds-gdm-theme
_realname=Clouds
pkgver=1.0
_id=100521
pkgrel=1
pkgdesc="A Clouds theme for gdm<2.8."
arch=('any')
url="http://gnome-look.org/content/show.php/Clouds?content=100521"
license=('GPL')
depends=('gdm-old')
source=("http://gnome-look.org/CONTENT/content-files/$_id-$_realname.tar.gz")
build() {
cd "${srcdir}/${_realname}"
install -d "${pkgdir}/usr/share/gdm/themes/"
cp -r "${srcdir}/${_realname}/" "${pkgdir}/usr/share/gdm/themes/"
}
md5sums=('6c9e32fb21bf7ff58bec04a81aebeb73')
