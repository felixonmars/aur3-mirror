# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=pdf2img-git
pkgver=76.69d9e51
pkgrel=1
pkgdesc="Convert easily PDF to multiple images in various formats with a single mouse click. PyQT4 version of pdf2img"
arch=('any')
url="https://github.com/wifiextender/pdf2png"
license=('GPL3')
depends=('ghostscript' 'python2-pyqt4' 'python2')
makedepends=('git')
source=('git+https://github.com/wifiextender/pdf2png.git'
         pdf2img.desktop
         pdf2img.sh)
md5sums=('SKIP'
         '480d0941917f99935f76c327912e1baf'
         'da7126a6f9f5779410eac35e4ce301a0')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/pdf2img
  cp -rf pdf2png/* $pkgdir/usr/share/pdf2img

  # Start file
  install -Dm755 pdf2img.sh $pkgdir/usr/bin/pdf2img

  # Desktop icon
  install -Dm644 pdf2img.desktop $pkgdir/usr/share/applications/pdf2img.desktop
  install -Dm644 pdf2png/data_pdf2img/images/pdf2img_icon.png $pkgdir/usr/share/pixmaps/pdf2img_icon.png  
}

pkgver() {
  cd $srcdir/pdf2png
  echo $(git rev-list --count master).$(git rev-parse --short master)
}