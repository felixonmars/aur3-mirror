# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=gnome-activity-journal
pkgver=0.8.0
pkgrel=4
pkgdesc="A tool for easily browsing and finding files on your computer"
arch=('any')
url="https://launchpad.net/gnome-activity-journal"
license=('GPL')
depends=('python2-gconf' 'zeitgeist>=0.6.0' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('python-distutils-extra')
optdepends=('python2-libgnome: get a thumbnail of an image or video file' 
            'gstreamer0.10-python: add multimedia tooltip to multimedia files'
            'python2-pygments: get a thumbnail of a text file')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz
        disable-set-background.patch
        fix-indicator-icon.patch
        make-libgnomeui-optional.patch)
md5sums=('46e493f090b41a49cfce422203791bc0'
         '23f0ead4fe6161e6aa71c8ad19ac5695'
         'b757b0c8e5ff06eb50d30f5028c5691b'
         'a158b002cf33efcfefb4fa06d7ef7da5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' src/config.py gnome-activity-journal
  patch -Np1 -i "$srcdir/disable-set-background.patch"
  patch -Np1 -i "$srcdir/fix-indicator-icon.patch"
  patch -Np1 -i "$srcdir/make-libgnomeui-optional.patch"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
