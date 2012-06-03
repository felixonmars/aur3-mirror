# Maintainer : sebikul <sebikul@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor : Emanuele Rossi nuovodna_at_gmail_com 
# Contributor: Nathan Owe <ndowens.aur at gmail.com>

pkgname=bashare
pkgver=0.5.0
pkgrel=4
pkgdesc="A simple and user-friendly filesharing tool for the Internet and/or LAN"
arch=('i686' 'x86_64')
url="http://code.google.com/p/bashare"
license=('GPL3')
depends=('miniupnpc' 'gambas2-runtime' 'gambas2-gb-gui'	'gambas2-gb-form' \
	'gambas2-gb-desktop' 'gambas2-gb-net' 'gambas2-gb-net-curl' 'gambas2-gb-settings')
	
makedepends=('gambas2-devel')
source=(http://bashare.googlecode.com/files/$pkgname\_$pkgver-1.tar.gz)
md5sums=('41f37ef58fb56c735de61430703894df')


build() {
  cd ${srcdir}/bashare
  ./configure --prefix=/usr
  make 


 }

package() {

  cd ${srcdir}/bashare

  make DESTDIR=${pkgdir} install
  ln -sr ./BaShare.gambas ./bashare
  
  
  install -Dm644 BaShare/bashare.png ${pkgdir}/usr/share/pixmaps/bashare.png
  install -Dm644 debian/bashare.desktop ${pkgdir}/usr/share/applications/bashare.desktop

}