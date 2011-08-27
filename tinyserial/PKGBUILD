# Contributor: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=tinyserial
pkgver=20090305
pkgrel=1
pkgdesc="Small minicom replacement for accessing serial ports on Linux inspired by FreeBSD 'tip'"
url="http://brokestream.com/tinyserial.html"
#url="http://freshmeat.net/projects/$pkgname"
license=('BSD')
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://brokestream.com/com.c")
md5sums=('43473cc681a0f069e513a837dcf888f3')

build() {
  cd "${srcdir}"
  gcc ${CFLAGS} -o com com.c || return 1
  sed -n '16,36p' com.c >license.txt || return 1
  install -D com "${pkgdir}"/usr/bin/com || return 1
  install -Dm644 license.txt "${pkgdir}"/usr/share/licenses/tinyserial/license.txt || return 1
}
