# Maintainer: Your Name <youremail@domain.com>
pkgname=reditr
pkgver=0.3.1.8
pkgrel=1
pkgdesc="A simple to navigate client for Reddit"
arch=('i686' 'x86_64')
url="http://reditr.com"
license=('proprietary')
depends=('gconf')
makedepends=('rpmextract' 'wget')
options=('!strip') # will NOT work when stripped

source=('reditr-bin' "$pkgname-$pkgver.rpm::http://reditr.com/downloads/linux/reditr_x86_64.rpm")
[ "$CARCH" = "i686" ] && source=('reditr-bin' "$pkgname-$pkgver.rpm::http://reditr.com/downloads/linux/reditr_i386.rpm")

md5sums=('b1a853f1d700c80f4293b3c402247c72' 'SKIP') # new versions appear on the same url

build() {
  rpmextract.sh "$pkgname-$pkgver.rpm"
  sed -i 's;Exec=/opt/reditr/reditr_app;Exec=/usr/bin/reditr;g' usr/share/applications/Reditr.desktop
}

package() {
  cp -ra opt ${pkgdir}/
  cp -ra usr ${pkgdir}/

  # hack until they compile it for recent libudev
  install -d ${pkgdir}/opt/reditr/lib
  ln -s /usr/lib/libudev.so.1 ${pkgdir}/opt/reditr/lib/libudev.so.0

  # startscript that sets LD_LIBRARY_PATH for the above hack etc.
  install -m 755 -d ${pkgdir}/usr/bin
  install -m 755 reditr-bin ${pkgdir}/usr/bin/reditr

  install -d ${pkgdir}/usr/share/pixmaps/
  ln -s /opt/reditr/128x128.png ${pkgdir}/usr/share/pixmaps/reditr.png
}

# vim:set ts=2 sw=2 et:
