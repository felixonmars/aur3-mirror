# Maintainer: Roel Gerrits <roel@roelgerrits.nl>
pkgname=python-pynplay
pkgver=0.1
pkgrel=1
pkgdesc="Python UPnP library"
arch=('any')
url="https://github.com/stereohead/pynplay"
license=('GPL')
depends=('python2' 'python2-lxml')
options=(!emptydirs)
source=(https://github.com/downloads/stereohead/pynplay/pynplay-$pkgver.tar.gz)
sha512sums=('8e853e799b71634e26d7517bfd8578a1f5766349758cd6855540815890762e599b61f8fc9a48fdfd64bdc71f9156e062c1aaf1f2e6f2ce004ff4bca50169450a')

package() {
  cd "$srcdir/pynplay-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


