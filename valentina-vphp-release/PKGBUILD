# Maintainer: Sam Van der Borght <sam@king-foo.be>
pkgname=valentina-vphp-release
pkgver=5.1.1
pkgrel=3
pkgdesc="Valentina database 64bit PHP 5.4 extension, required for connecting to valentina databases through PHP"
arch=('x86_64')
url="http://www.valentina-db.com/download/beta/"
license=('unknown')
depends=(libpng12)
makedepends=('rpmextract')
options=('emptydirs')
source=("http://www.valentina-db.com/download/prev_releases/5.1.1/linux_64/vphp_standalone_x64_5_lin.rpm")
md5sums=('35166add7d12f83993f2e3945ec17cb1')
package() {
  cd "$pkgdir"
  rpmextract.sh ../vphp_standalone_x64_5_lin.rpm
  rm -rf "$srcdir/opt/VPHP_Standalone/vcomponents/libz.so*"
  rm -rf "$srcdir/opt/VPHP_Standalone/vcomponents/libtiff.so.4*"

  mkdir -p "$pkgdir/etc/php/conf.d"
  echo "extension=/opt/VPHP_Standalone/php54_valentina_standalone.so" > "$pkgdir/etc/php/conf.d/valentina.ini"
  echo "extension=/opt/VPHP_Standalone/pdo54_valentina.so" >> "$pkgdir/etc/php/conf.d/valentina.ini"
}
build() {
  mkdir -p $pkgdir/usr/lib
  install $srcdir/opt/VPHP_Standalone/vcomponents/libvclient_release_x64.so $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libvshared_release_x64.so $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libvkernel_release_x64.so $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libvreport_release_x64.so $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libicuio.so.48 $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libicui18n.so.48 $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libicuio.so.48 $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libicuuc.so.48 $pkgdir/usr/lib/
  install $srcdir/opt/VPHP_Standalone/vcomponents/libicudata.so.48 $pkgdir/usr/lib/
}
post_install() {
  ldconfig
  msg "If your PHP directory is not (/etc/php/conf.d/) you must add the extension manually."
  msg "------------------------------------------------------------------------------------"
  msg "Create a file valentina.ini in your PHP config dir (eg. /etc/php/conf.d/)."
  msg "PHP 5.4: Add the following line to it: extension=/opt/VPHP_Standalone/php54_valentina_standalone.so"
}
