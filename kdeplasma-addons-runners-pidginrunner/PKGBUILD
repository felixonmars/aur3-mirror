# Maintainer: ThecaTTony <thecattony at gmx dot com>

pkgname=kdeplasma-addons-runners-pidginrunner
pkgver=0.2
pkgrel=1
pkgdesc='Set the status in Pidgin, search the buddy list and open chats from KRunner.'
arch=('i686' 'x86_64')
url=("http://kde-apps.org/content/show.php/PidginRunner?content=151998")
license=('GPL')
depends=('kdebase-workspace>=4.2')
makedepends=('automoc4' 'cmake')
replaces=('kdeplasma-runners-pidginrunner')
source=("http://kde-apps.org/CONTENT/content-files/151998-PidginRunner-0.2.tar.gz")
md5sums=('d9c456d092ca35f5e0f92a6cdf79e9ee')

build() {
  cd ${srcdir}/PidginRunner/
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make || return 1
}
package() {
  cd ${srcdir}/PidginRunner/build/
  make DESTDIR=${pkgdir} install
}
