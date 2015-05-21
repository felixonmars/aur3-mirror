pkgname='vlmcsd'
pkgver=svn779
pkgrel=1
pkgdesc="KMS activation using vlmcs."
url="http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms"
license='GPL'
arch=('any')
depends=('clang')
source=("vlmcsd.tar.gz"
        'vlmcsd.service')
install='vlmcsd.install'
sha256sums=("32d8ee719f4708cef873e7896b2e4920172b004891e1106f2fbb0759ac99bfb4"
	    "bcaff9edeb0b215535d1d273283c5c5b79cbb652c5a1dfab6798e8b2a671ae7a")

build() {
  cd "${srcdir}/"
  export CC=clang
  make
}

package(){
  cd "${srcdir}/"

  install -d -m 755 ${pkgdir}/usr/bin/
  install -D -m 755 vlmcsd ${pkgdir}/usr/bin
  install -D -m 755 vlmcs ${pkgdir}/usr/bin

  install -d -m 755 ${pkgdir}/var/lib/vlmcsd

  install -D -m 644 vlmcs.1 "${pkgdir}/usr/share/man/man1/vlmcs.1"
  install -D -m 644 vlmcsd.7 "${pkgdir}/usr/share/man/man7/vlmcsd.7"
  install -D -m 644 vlmcsd.8 "${pkgdir}/usr/share/man/man8/vlmcsd.8"

  # Create vlmcsd service
  install -D -m 644 ${srcdir}/vlmcsd.service ${pkgdir}/usr/lib/systemd/system/vlmcsd.service
}
