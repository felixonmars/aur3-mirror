# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=img2pdf-git
pkgver=0.r88.18a41fc
pkgrel=1
pkgdesc="Lossless conversion of images to PDF without unnecessarily re-encoding JPEG files"
arch=('any')
url="https://gitlab.mister-muffin.de/josch/img2pdf"
license=('GPL3')
depends=('python2' 'python2-pillow')
makedepends=('git' 'python2-setuptools')
provides=('img2pdf')
conflicts=('img2pdf')
source=("$pkgname"::'git+https://gitlab.mister-muffin.de/josch/img2pdf.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname/src"
  sed -i '18s/import Image/from PIL import Image/' img2pdf.py
  sed -i '1s/python/python2/' jp2.py
}

package() {
  cd "$srcdir/$pkgname/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
