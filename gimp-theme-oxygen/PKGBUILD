# Maintainer : quasifilmie

pkgname=gimp-theme-oxygen
pkgver=0.1
pkgrel=1
pkgdesc="A theme that provides KDE integration to gimp"
arch=('any')
url="https://opendesktop.org/content/show.php/Gimp-Oxygen+Icons+Theme?content=144683"
license=('Unknown')
depends=('gimp')
source=("http://sourceforge.net/projects/chakra/files/Tools/Gimp-Oxygen/Gimp-Oxygen-0.1.tar.gz")
sha1sums=('6f5dba5db73e3a6063cafaa75f9fa2576c64a9b9')

package() {
   cd ${srcdir}
   tar -zxf Gimp-Oxygen-0.1.tar.gz || return 1
   install -d ${pkgdir}/usr/share/gimp/2.0/themes
   cp -r ${srcdir}/Gimp-Oxygen ${pkgdir}/usr/share/gimp/2.0/themes || return 1
}
