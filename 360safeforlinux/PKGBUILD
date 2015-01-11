# Maintainer: yk < yk at archlinuxcn dot org>

pkgname=360safeforlinux
pkgver=3.0.0.67
pkgrel=1
pkgdesc="A system guard from Qihoo 360."
arch=('i686' 'x86_64')
url="http://linux.360.cn"
license=('custom')
depends=('glibc>=2.14' 'glib2>=2.38' 'python2>=2.7.6' 'openssl>=1.0' 'curl' 'qt4' 'libxml2' 'python' 'libcurl-gnutls')
provides=("360safe")
install=$pkgname.install
changelog=$pkgname.changelog

source_i686+=("http://down.360safe.com/linuxsafe/deepin32/${pkgname}-${pkgver}-stripped.deb")
md5sums_i686+=('17579751f62001935337af60a06cdc8e')
source_x86_64+=("http://down.360safe.com/linuxsafe/deepin64/${pkgname}-${pkgver}-stripped.deb")
md5sums_x86_64+=('3060abb27fd2d0eca959ed1fc9863cfd')
 
package () 
{
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "$pkgdir/opt/360safeforlinux/img/360logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/360logo.png"
  install -Dm644 "$pkgdir/opt/360safeforlinux/license.txt" "$pkgdir/usr/share/licenses/360safeforlinux/license.txt"
  mkdir -p "$pkgdir/usr/share/licenses/360safeforlinux/"
  cp -r "$pkgdir/opt/360safeforlinux/license" "$pkgdir/usr/share/licenses/360safeforlinux/"
  rm -rf "$pkgdir/opt/360safeforlinux/license"
}
