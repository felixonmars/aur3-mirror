# Maintainer: yk < yk at archlinuxcn dot org>

pkgname=360safeforlinux
pkgver=3.0.0.66
pkgrel=2
pkgdesc="A system guard from Qihoo 360."
arch=('i686' 'x86_64')
url="http://linux.360.cn"
license=('custom')
depends=('glibc>=2.14' 'glib2>=2.38' 'python2>=2.7.6' 'openssl>=1.0' 'curl' 'qt4' 'libxml2' 'python' 'libcurl-gnutls')
provides=("360safe")
install=$pkgname.install

if [ "$CARCH" = "i686" ]; then
    source=("http://down.360safe.com/linuxsafe/deepin32/${pkgname}-${pkgver}-stripped.deb")
    md5sums=('545a1c311a6bfabc32663d1117087cae')
elif [ "$CARCH" = "x86_64" ]; then
    source=("http://down.360safe.com/linuxsafe/deepin64/${pkgname}-${pkgver}-stripped.deb")
    md5sums=('f11e77e60021cf4125df35299992ed59')
fi
    
package () 
{
  msg2 "Extracting the data.tar.lzma"
  tar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 "$pkgdir/opt/360safeforlinux/img/360logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/360logo.png"
  install -Dm644 "$pkgdir/opt/360safeforlinux/license.txt" "$pkgdir/usr/share/licenses/360safeforlinux/license.txt"
  install -dm 755 "$pkgdir/opt/360safeforlinux/license" "$pkgdir/usr/share/licenses/360safeforlinux/license"
}
