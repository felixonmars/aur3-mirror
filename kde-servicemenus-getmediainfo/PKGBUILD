# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kde-servicemenus-getmediainfo
pkgver=0.6
pkgrel=1
pkgdesc="Simple service menu that show the mediainfo about the selected media."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?action=content&content=141946"
license=('GPL')
depends=('kdebase-workspace' 'kdebase-kdialog' 'mediainfo')
conflicts=('getmediainfo-servicemenu-kde4')
replaces=('getmediainfo-servicemenu-kde4')
source='http://kde-apps.org/CONTENT/content-files/141946-MediaInfoKDE.desktop'
md5sums=('8a14b856b510378a2dcf8bc4d2eec0c8')

build() {
  /bin/true
}

package() {
  install -Dm644 ${srcdir}/*-MediaInfoKDE.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/getmediainfo.desktop
}