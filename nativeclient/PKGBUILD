# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=nativeclient
pkgver=20100122
pkgrel=1
_nacl_id=782a_2010_01_22
pkgdesc="Native Client from Google"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license=('GPL2')
depends=()
makedepends=('python')
optdepends=()
conflicts=()
source=(http://build.chromium.org/buildbot/snapshots/nacl_tarballs/nacl_linux_${_nacl_id}.tgz)
md5sums=('5ccb4c2b5f04c4037b8cc652ebfb9d5f')

build() {
  cd $srcdir/build/native_client/
  ./scons
  mkdir -p ${pkgdir}/usr/lib/mozilla/plugins
  install -Dm755 scons-out/opt-linux-x86-32/obj/src/trusted/service_runtime/sel_ldr ${pkgdir}/usr/lib/mozilla/plugins
  install -Dm755 scons-out/opt-linux-x86-32/obj/src/trusted/plugin/libnpGoogleNaClPlugin.so ${pkgdir}/usr/lib/mozilla/plugins
  install -Dm755 scons-out/opt-linux-x86-32/obj/src/trusted/sandbox/sel_ldr.trace ${pkgdir}/usr/lib/mozilla/plugins
  install -Dm755 tools/sel_ldr.bash ${pkgdir}/usr/lib/mozilla/plugins
}
# vim:syntax=sh
