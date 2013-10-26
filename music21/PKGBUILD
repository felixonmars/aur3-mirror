# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Gustavo A. Gomez Farhat <gustavo_dot_gomez_dot_farhat at gmail_dot_com>

pkgname=music21
pkgver=1.6.0
pkgrel=1
pkgdesc="Toolkit for Computer-Aided Musicology and Musical Analysis."
url="http://code.google.com/p/music21/"
arch=('any')
license=('GPL')
depends=('python2-setuptools')
source=("http://music21.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('a8403cc58888549677d7320eed832d0d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

