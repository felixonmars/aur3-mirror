# Maintainer: Justin Kueser < [firstname] dot [lastname] at gmail dot com>

pkgname=dvdrip-queue
pkgver=0.1.3
_pkgtag=.orig
pkgrel=1
pkgdesc="A piece of software that allows you to create a queue of DVD::Rip projects."
arch=('i686' 'x86_64')
url="http://dvdrip-queue.sourceforge.net/"
license=('GPL3')
depends=('dvdrip' 'python2' 'libglade' 'pygtk')
install=dvdrip-queue.install
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}${_pkgtag}.tar.gz"
"dvdrip-version.patch"
"dvdrip-queue-prefswindow.patch"
"dvdrip-queue.install"
"dvdrip-queue-doencode.patch")
sha256sums=('df6d19ce6fdab0887cb9b46b8c8905bb8d4c06e418e774f8b629d13272860da1'
'7e1d4c00c33edf0d7cbe068567c80b804fbb261f89588e1ee6d69848f20f001b'
'6d1fa418e465669ec8b32adb471e7d29e3a5036740e5d947f7bb99dac50a4aff'
'2d12300f0bd6c18399d4738762c845ff70ec382d5ca79dd38695210dd60c89fa'
'07aff3e8aad8d2aca88329b1976613fb49d76f025752aa70319be11b1bf0c7b5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -uN dvdrip-queue ../dvdrip-version.patch || return 1
  patch -uN ./dvdripQueue/prefsWindow.py ../dvdrip-queue-prefswindow.patch || return 1
  patch ./dvdripQueue/doEncode.py < ../dvdrip-queue-doencode.patch || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
}
