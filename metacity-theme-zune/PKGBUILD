# Contributor: Shae Smittle <starfall87>

pkgname=metacity-theme-zune
_pkgname=Zune
pkgver=0.03
pkgrel=1
pkgdesc="The Windows XP Zune Theme for Metacity"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Zune+-+Metacity+and+XFWM4?content=65146"
license=('GPL')
depends=('metacity')
source=("Zune-0.03.tar.gz")
md5sums=('143a9c0498bf208d5a2412294488b12a')

build() {
  cd ${srcdir}/Zune
  install -d ${pkgdir}/usr/share/themes/${_pkgname}
  cp -rf * ${pkgdir}/usr/share/themes/${_pkgname} || return 1
}


