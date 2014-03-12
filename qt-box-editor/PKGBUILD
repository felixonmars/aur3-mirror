# Maintainer: Solumin <gmail: magesolumin>

pkgname=qt-box-editor
pkgver=1.11
pkgrel=1
pkgdesc="A Qt-based tool for adjusting tesseract box files"
arch=()
url="https://github.com/zdenop/qt-box-editor"
license=('Apache')
depends=('qt4'
         'tesseract')
makedepends=('make' 'git' 'qtchooser')
source=("git://github.com/zdenop/qt-box-editor")
md5sums=('SKIP') # can't really keep checking a git repo...
arch=(any)

_gitname=qt-box-editor

# read package version from the CURRENT_VERSION file
pkgver() {
  cd "$srcdir/$_gitname"
  cat CURRENT_VERSION
}

build() {
  cd "$srcdir/$_gitname"
  qtchooser -run-tool=qmake -qt=4 qt-box-editor.pro
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin/"
  mv "qt-box-editor-$pkgver" qt-box-editor
  install -m 755 -p qt-box-editor "$pkgdir/usr/bin/"
}
