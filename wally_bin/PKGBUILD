# Contributor: osily <ly50247 (at) gmail.com>

pkgname=wally_bin
_realname=wally
pkgver=2.4.4
pkgrel=1
pkgdesc="A Qt4 wallpaper changer for the major DEs using online image libraries"
arch=("x86_64")
url="http://www.becrux.com/index.php?page=projects&name=${_realname}"
license=("GPL")
depends=("qt" "libexif")
source=(http://www.becrux.com/pages/projects/${_realname}/${_realname}_${pkgver}-1_amd64.deb)

build() {

cd ${srcdir}
ar x ${_realname}_${pkgver}-1_amd64.deb
tar -xvzf data.tar.gz
rm -r usr/share/menu
install -d ${pkgdir}/usr/bin
install -D -m755 ${srcdir}/usr/bin/wally ${pkgdir}/usr/bin/wally
cp -r ${srcdir}/usr/share ${pkgdir}/usr/share

}

md5sums=('90c83a5d2279412479f4f332b415691a')
