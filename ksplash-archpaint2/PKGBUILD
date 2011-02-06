# Contributor : BlackEagle < ike DOT devolder AT herecura DOT be >

pkgname=ksplash-archpaint2
pkgver=1.1
pkgrel=2
pkgdesc="KSplash theme based on archpaint2 wallpaper"
arch=('any')
url="http://www.archlinux.org"
license=('CCPL')
depends=('kdebase-workspace' 'wallpaper-archpaint2')
source=("http://www.herecura.be/archlinux/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('83fbb2541fee33437f039eedb0de2a2988fd8df7a05dffc70e95d7cac654deee')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes
  cp -r archpaint2 ${pkgdir}/usr/share/apps/ksplash/Themes
}
