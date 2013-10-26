# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=espeak-gui
pkgver=0.4
pkgrel=3
pkgdesc="GUI for eSpeak"
arch=('any')
url="https://launchpad.net/espeak-gui"
license=('GPL3')
depends=('gtk2' 'pygtksourceview2' 'python2-espeak' 'python2-gconf' 'python2-gobject2' 'python2-gtkspell' 'python2-xdg')
makedepends=('python2-distutils-extra')
source=(http://launchpad.net/espeak-gui/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('1f4cb2c3ebbb2be9584b37696099f380')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Python2 fix
  sed -i 's|env python|env python2|' setup.py espeak-gui
}

package() {
  cd $srcdir/$pkgname-$pkgver 
  python2 setup.py install --root $pkgdir
}
