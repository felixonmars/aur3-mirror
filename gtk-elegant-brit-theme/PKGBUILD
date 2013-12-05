# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=gtk-elegant-brit-theme
_pkgname="Elegant_Brit"
pkgver=20130717
_pkgver=3.8
pkgrel=1
pkgdesc="Elegant Brit GTK theme, a mod of Elegant One."
arch=('any')
url="http://grvrulz.deviantart.com/art/Elegant-Brit-gnome3-208925032"
license=('GPLv3')

_tarname="${_pkgname}-${_pkgver}"
depends=('gtk-engine-mist')
source=("https://trizen.googlecode.com/files/${_tarname}.tar.gz")
md5sums=('4bcfdf49df8bfcd9f2534a6f9ad903b3')

package() {
    install -d "$pkgdir/usr/share/themes/"
    cp -r "${_tarname}/" "$pkgdir/usr/share/themes/"
}
