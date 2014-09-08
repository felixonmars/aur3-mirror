# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gfeedline
pkgver=2.4.2
pkgrel=1
pkgdesc="A social networking client that supports Twitter"
arch=('any')
url="http://code.google.com/p/gfeedline/"
license=('GPL3' 'custom:MIT')
depends=('webkitgtk' 'python2-beautifulsoup3' 'python2-service-identity'
         'python2-oauth' 'python2-gobject' 'python2-dateutil'
         'python2-pyopenssl' 'python2-xdg' 'twisted')
makedepends=('python2-distutils-extra' 'intltool')
optdepends=('python2-gtkspellcheck: for spell checking')
install="$pkgname.install"
#source=("http://gfeedline.googlecode.com/files/$pkgname-$pkgver.tar.gz")
source=("https://dl.dropboxusercontent.com/u/4418967/GFeedLine/gfeedline-$pkgver.tar.gz")
md5sums=('42e639a5b3ceebec5bb573b837144181')

prepare() {
  cd $pkgname-$pkgver

  # python2 shebang
  find . -name "*.py" -exec \
    sed -i '1s|python|&2|' {} \;
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/"

  # fix perms
  chmod -R go+r "$pkgdir/usr/share/$pkgname/html"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
