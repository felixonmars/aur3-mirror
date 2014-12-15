# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=ocrfeeder-git
_pkgname=ocrfeeder
pkgver=0.8
pkgrel=1
pkgdesc="GTK+ document layout analysis and optical character recognition application"
arch=('any')
url="http://live.gnome.org/OCRFeeder"
license=('GPL')
provides=ocrfeeder
conflicts=ocrfeeder
depends=('python2-pyenchant' 'pygoocanvas' 'python2-gtkspell' 'python2-imaging' 'python2-lxml' 'python2-reportlab' 'ghostscript' 'unpaper' 'sane' 'desktop-file-utils' 'goocanvas')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'goocanvas')
optdepends=('tesseract: character recognition'
            'ocrad: character recognition'
            'gocr: character recognition'
            'cuneiform: character recognition')
install=$_pkgname.install
source=('git+git://git.gnome.org/ocrfeeder')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g' | sed 's|release_||g'
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' bin/ocrfeeder*.in src/ocrfeeder/odf/*.py

  ./autogen.sh PYTHON=python2
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/pixmaps"
  ln -s ../ocrfeeder/icons/ocrfeeder.svg "$pkgdir/usr/share/pixmaps/ocrfeeder.svg"
}
