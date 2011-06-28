# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=colorfolder-oxygen
pkgver=1.0.2
pkgdesc="KDE service menu for colorizing folders - oxygen style icons."
pkgrel=1
arch=(any)
_kdeapps=34096
url="http://kde-apps.org/content/show.php?content=${_kdeapps}"
license=(GPLv2)
makedepends=()
depends=('kdebase-workspace')
options=()
source=(http://kde-apps.org/CONTENT/content-files/${_kdeapps}-${pkgname}-${pkgver}.tar.gz)
md5sums=('d9f19cf5f0b54e1fe63ddaeb7b338bb7')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m 644 colorfolder.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/colorfolder.desktop
  install -D -m 755 colorfolder ${pkgdir}/usr/bin/colorfolder
}

# package(){
#   cd ${srcdir}/${_pname}
#   make DESTDIR="${pkgdir}" install
# }