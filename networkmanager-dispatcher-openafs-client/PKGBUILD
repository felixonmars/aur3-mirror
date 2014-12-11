# Maintainer: Alexander Schmidt <alex treefish org>
# Based on package by Jelle van der Waa <jelle vdwaa nl>
pkgname=networkmanager-dispatcher-openafs-client
pkgver=1.1
pkgrel=1
pkgdesc="Dispatcher Script for openafs-client"
arch=(any)
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'openafs')
source=("10-openafs-client" "LICENSE")
md5sums=('650d27b3ec3c85323f35badc5ea6f297'
         '07e84aa82c49f63e730cd21977eb5545')

package() {
  install -Dm700 $srcdir/10-openafs-client \
  	  $pkgdir/etc/NetworkManager/dispatcher.d/10-openafs-client
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
