
# Maintainer: Jose Moya  <pepe80@gmx.es>
pkgname=tvenlinux
pkgver=01062014
pkgrel=3
pkgdesc="Script para ver los canales de TDT de España. Script for view Spain's TDT channels"
arch=(any)
license=('GPL3')
url="http://www.tvenlinux.com"
depends=('mplayer'  'rtmpdump' )
optdepends=('zenity: for GTK users' 'kdialog: for QT users'
'curl: for view EPG (Electronic Program Guide) ')
source=('http://www.tvenlinux.com/TVenLinux.sh')
md5sums=('a8f1c8d9d87f84e29bcca2de1656a3fd')

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin
  install -m 755 TVenLinux.sh  $pkgdir/usr/bin/${pkgname}
}
