# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=blink
pkgver=1.3.0
pkgrel=1
pkgdesc="A state of the art easy to use Qt SIP client"
arch=('any')
url="http://www.icanblink.com"
license=('custom:MIT')
depends=('python2-cjson' 'python2-pyqt' 'python2-sipsimple' 'python2-eventlib' 'libvncserver' 'cython2')
source=(
        "http://download.ag-projects.com/BlinkQt/$pkgname-$pkgver.tar.gz"
        "blink.desktop"
        )
sha256sums=(
        '388a0ca72ad99087cd87b78a4c449f9c079117920bfc50d7843853b8f942d045'
        '3d9bfe4e54a5e36747b6ffcca5d26d0e19d2292855d10a94543e0891ddf7dd0f'
        )

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # license
  install -Dm644 doc/license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file
  install -Dm644 "$startdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
