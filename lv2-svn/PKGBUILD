# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=lv2-svn
pkgver=1.8.1.r911
pkgrel=1
pkgdesc="A standard for plugins and matching host applications, mainly targeted at audio processing and generation."
arch=('i686' 'x86_64')
url="http://lv2plug.in/"
license=('custom:ISC')
makedepends=('subversion' 'python2' 'libsndfile' 'gtk2')
optdepends=('libsndfile: example extension'
            'gtk2: example extension'
            'python2: scripts')
provides=("lv2=$pkgver")
conflicts=('lv2')
replaces=('lv2core')
source=("$pkgname::svn+http://lv2plug.in/repo/trunk")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(awk -F "'" '/^VERSION/{print $2}' wscript).r$(svnversion)"
}

build() {
  cd $pkgname
  python2 waf configure --prefix=/usr
  python2 waf build $MAKEFLAGS
}

package() {
  cd $pkgname
  python2 waf install --destdir="$pkgdir/"

  # python2 shebangs
  sed -i 's/python/&2/' "$pkgdir/usr/bin/lv2specgen.py"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
