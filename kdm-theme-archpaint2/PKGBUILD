# Contributor : BlackEagle < ike DOT devolder AT herecura DOT be >

pkgname=kdm-theme-archpaint2
pkgver=1.0
pkgrel=1
pkgdesc="KDM themes based on archpaint2 wallpaper"
arch=('any')
url="http://www.archlinux.org"
license=('CCPL')
depends=('kdebase-workspace' 'wallpaper-archpaint2')
source=("http://www.herecura.be/archlinux/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d20192b540260f1a751ab65801c1350c2b833279317e0f1b7bf66e34b2b3d143')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/apps/kdm/themes
  cp -r archpaint2* ${pkgdir}/usr/share/apps/kdm/themes
}
