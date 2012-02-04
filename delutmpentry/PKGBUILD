# Maintainer: kfgz <kfgz at interia pl>

pkgname=delutmpentry
pkgver=0.0.0.1
pkgrel=1
pkgdesc="A script that removes broken/orphanded utmp entry"
arch=('i686' 'x86_64')
url="http://www.linuxquestions.org/questions/linux-server-73/fix-utmp-remove-orphaned-utmp-entry-769755/"
license=('custom')
depends=('vi')
makedepends=()
source=(delutmpentry)
md5sums=('8d833d982f79d31fd8f727b5a0394075')

package() {
  cd ${srcdir}
  install -Dm755 delutmpentry ${pkgdir}/usr/bin/delutmpentry
}
