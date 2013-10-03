# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Pablo Lezaeta <prflr (arroba) gmail (dot) com>

pkgname=xfce-theme-light
realpkg=light-themes
pkgver=0.1.93
pkgrel=1
pkgdesc="Ubuntu 'light' themes Ambiance and Radiance (GTK2 and GTK3) whit Xfce support"
arch=('any')
url="https://launchpad.net/light-themes/"
license=('CC-SA')
depends=("gtk-engine-murrine")
optdepends=("gtk3: For gtk-3 support"
"gtk-engine-unico: For gtk-3 support")
provides=("light-themes")
conflicts=("light-themes")
replaces=("light-themes")
source=("${realpkg}-${pkgver}.tar.gz::https://launchpad.net/ubuntu/quantal/+source/${realpkg}/${pkgver}/+files/${realpkg}_${pkgver}.tar.gz"
"light-themes-0.1.93-gtk3.8-1.patch"
"light-themes-0.1.93-gtk3.8-2.patch"
"light-themes-0.1.93-gtk3.8-3.patch"
"xfwm4-ambiance-radiance.tar.gz::http://debian-art.org/CONTENT/content-files/146674-Ambiance&Radiance-XfceLXDE-11-10-2.tar.gz")
md5sums=('57baa4b1ab33288e2f31454fe39be25c'
         'c560861830a9143d7dad592b413a8b24'
         '0521669355d4900dd600191477ea8ad6'
         '43851c0c166f949b7c88c2a0d600f27e'
         '7850c32b7a6c7d5e297a3f70376f82c4')

prepare() {
  cd "${srcdir}/light-themes-${pkgver}/"
  patch -Np0 -i ../light-themes-0.1.93-gtk3.8-1.patch
  patch -Np0 -i ../light-themes-0.1.93-gtk3.8-2.patch
  patch -Np0 -i ../light-themes-0.1.93-gtk3.8-3.patch
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"

# Light-themes
  cd "${srcdir}/light-themes-${pkgver}/"
  cp -rv "Ambiance" "${pkgdir}/usr/share/themes"
  cp -rv "Radiance" "${pkgdir}/usr/share/themes"
  sed -i -e "/shadow radius/d" "${pkgdir}/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
  sed -i -e "/shadow radius/d" "${pkgdir}/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
  sed -i -e "/padding/d" "${pkgdir}/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
  sed -i -e "/padding/d" "${pkgdir}/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
  sed -i -e "/trough/d" "${pkgdir}/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
  sed -i -e "/trough/d" "${pkgdir}/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"

# Xfwm4-Ambiance and Openbox-Ambiance
  cd "${srcdir}/Ambiance-Xfce-LXDE"
  cp -rv "xfwm4" "${pkgdir}/usr/share/themes/Ambiance"
  cp -rv "openbox-3" "${pkgdir}/usr/share/themes/Ambiance"

# Xfce4-Radiance and Openbox-Radiance
  cd "${srcdir}/Radiance-Xfce-LXDE"
  cp -rv "xfwm4" "${pkgdir}/usr/share/themes/Radiance"
  cp -rv "openbox-3" "${pkgdir}/usr/share/themes/Radiance"
}

# vim:set ts=2 sw=2 et:
