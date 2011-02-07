# Maintainer: Gordin <9ordin @t gmail dot com>

pkgname=logcat
pkgver=0.1
pkgrel=1
pkgdesc='script to highlight adb logcat output for console'
arch=('any')
url="http://jsharkey.org/blog/2009/04/22/modifying-the-android-logcat-stream-for-full-color-debugging"
license=('APACHE')
depends=('android-sdk-platform-tools' 'python2')

source=("${pkgname}::http://jsharkey.org/downloads/coloredlogcat.pytxt")
sha256sums=('bcf780e4e79b059fc11bac9d8e5fbb94c1eee68ec55691e72dc43c358bb3496f')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  cd "${pkgdir}/usr/bin"
  cp ${srcdir}/${pkgname} .
  sed -i "s|python|python2|" ${pkgname}
  chmod +x ${pkgname}
}
