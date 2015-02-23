# Maintainer: Patricius <quillkiragimmys[@]gmail.com>
pkgname=djvuhocr-git
_gitname=${pkgname%-git}
pkgver=0.2
pkgrel=2
pkgdesc="A tiny script applies tesseract's hOCR results on DjVu files."
arch=('any')
url="https://github.com/quillkiragimmy/djvuhocr"
license=('GPL2')
depends=('perl' 'tesseract' 'djvulibre' 'tesseract-data-eng')
makedepends=('git')
provides=('djvuhocr')
backup=()
optdepends=('tesseract-data: for different language support')
source=("git+https://github.com/quillkiragimmy/djvuhocr.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git --no-pager describe --tags | sed -e 's/v//; s/-/./g'
}

package() {
  cd "$_gitname"
	install -D -m755 "djvuhocr" "${pkgdir}/usr/bin/djvuhocr"
}

