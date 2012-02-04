# created 01:29:58 - 12/11/09
# Contributor: Lisandro <animal_urbano7 at hotmail.com>
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kdeplasma-addons-applets-internet-ip
pkgver=0.03
pkgrel=1
pkgdesc="Show your Internet IP and the country flag."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Show+Internet+IP+with+Flag?content=113309"
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python')
source=("http://kde-look.org/CONTENT/content-files/113309-internet-ip.zip")
md5sums=('05657bb5b35ce85da2e4bb6321fbb49d')

build() {

  cd $srcdir

  install -dm755 ${pkgdir}/usr/share/apps/plasma/plasmoids/internet-ip || return 1
  cp -R {contents,metadata.desktop} ${pkgdir}/usr/share/apps/plasma/plasmoids/internet-ip/ || return 1
  install -Dm644 metadata.desktop ${pkgdir}/usr/share/kde4/services/plasma-applet-internet-ip.desktop || return 1

}