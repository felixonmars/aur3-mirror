# $Id: PKGBUILD,v 1.12 2008/11/27 20:35:29 pressh Exp $
# Maintainer: Smartboyathome <smartboyathome@gmail.com>
pkgname=oz-e17-tools
pkgver=0.07.6
pkgrel=1
pkgdesc="A zenity script which is made to accompany the package easy-e17. It makes several aspects of updating e17 easier."
arch=('i686' 'x86_64')
url="http://cafelinux.org/OzOs/"
source=(http://cafelinux.org/Downloads/oz-os/pool/main/o/oz-e17-tools/${pkgname}_${pkgver}_all.deb)
license=('GPL')
makedepends=('deb2targz')
depends=('easy-e17' 'zenity')
options=('!libtool')
md5sums=('884dc6cf35d0d8ab6e5aeab3f9d6dce4')

build() {
   cd $srcdir
   deb2targz ${pkgname}_${pkgver}_all.deb
   tar -xvzf ${pkgname}_${pkgver}_all.tar.gz
   mkdir -p ${pkgdir}/usr/bin/
   mkdir -p ${pkgdir}/usr/share/applications/
   mkdir -p ${pkgdir}/usr/share/pixmaps/
   install -D ./usr/bin/update_e17.sh ${pkgdir}/usr/bin/
   install -D ./usr/share/applications/Backup_e17.desktop ${pkgdir}/usr/share/applications/
   install -D ./usr/share/applications/Update_e17.desktop ${pkgdir}/usr/share/applications/
   install -D ./usr/share/pixmaps/e17_logo.png ${pkgdir}/usr/share/pixmaps/
}
