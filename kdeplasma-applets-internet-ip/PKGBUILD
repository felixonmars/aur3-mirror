# Contributor: Lisandro <animal_urbano7 at hotmail.com>
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=kdeplasma-applets-internet-ip
pkgver=0.4
pkgrel=1
pkgdesc="Show your Internet IP and the country flag"
arch=('any')
url="http://kde-look.org/content/show.php/Show+Internet+IP+with+Flag?content=113309"
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python2')
conflicts=('kdeplasma-addons-applets-internet-ip')
replaces=('kdeplasma-addons-applets-internet-ip')
source=("http://kde-look.org/CONTENT/content-files/113309-internet-ip.zip")
md5sums=('bdf165e571a991073edebf1d0fda3edc')

build() {
  install -d "${pkgdir}"/usr/share/apps/plasma/plasmoids/internet-ip/contents/code
  install -m644 metadata.desktop \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/internet-ip/
  install -m644 contents/code/{config,IP_Retriever,main}.py \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/internet-ip/contents/code/
  install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-internet-ip.desktop
}