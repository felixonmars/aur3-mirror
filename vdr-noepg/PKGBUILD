# Maintainer: Healing Hands <healing-hands[at]gmx[dot]de>
pkgname=vdr-noepg
pkgver=0.0.4
_gitver=b18cfff51a8d7722cc7f8ae511596714995f6c92
_vdrapi=2.2.0
pkgrel=1
pkgdesc="This plugin will replace the noepg-patch with the new cEpgHandler of vdr >= 1.7.26."
url="https://github.com/flensrocker/vdr-plugin-noepg"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=("vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=$(echo $pkgname | sed 's/vdr-//g')
source=("git://github.com/flensrocker/vdr-plugin-noepg.git#commit=$_gitver"
        "50-$_plugname.conf")
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('SKIP'
         'c3719b31f2b581e210bd2654159bfe5c')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --tags | sed 's/-/_/g;s/v//'
}

build() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make
#  make -j1 -C dist/noepg
}

package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install
#  make DESTDIR="$pkgdir" install -C dist/noepg

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  mkdir -p "$pkgdir/var/lib/vdr/plugins/noepg"
  chown -R 666:666 "$pkgdir/var/lib/vdr/plugins/noepg"
}
