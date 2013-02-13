# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=komodo-debug-php
pkgver=8.0.0
_pkgver=beta1-76860
pkgrel=1
pkgdesc="Enables remote PHP debugging in Komodo IDE 8"
url="http://code.activestate.com/komodo/remotedebugging/"
arch=('x86_64' 'i686')
license=('custom')
source=("http://downloads.activestate.com/Komodo/releases/8.0.0b1/remotedebugging/Komodo-PHPRemoteDebugging-${pkgver}-${_pkgver}-linux-${arch}.tar.gz"
	"xdebug.ini")
md5sums=('89e455b81f1b3f8a97802aa6c8707ef0'
	 '4c26820d730fba04813852a984f3fda1')
conflicts=('xdebug')
backup=('etc/php/conf.d/xdebug.ini')

build() {
  cd ${srcdir}/Komodo-PHPRemoteDebugging-${pkgver}-${_pkgver}-linux-${arch}
  
  install -D -m644 ./5.4/xdebug.so ${pkgdir}/usr/lib/php/modules/xdebug.so
  install -D -m644 ${srcdir}/xdebug.ini ${pkgdir}/etc/php/conf.d/xdebug.ini
  
  # Install the license
  install -D -m644 ./LICENSE.txt ${pkgdir}/usr/share/licenses/komodo-debug-php/LICENSE.txt
}
