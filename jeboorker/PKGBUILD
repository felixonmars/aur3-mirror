# Maintainer: Matthias Geist <mg@morologia.net>
pkgname=jeboorker
pkgver=0.4.6
pkgrel=1
pkgdesc="A gui ebook management software which can be merged with an existing ebook folder structure. Supports epub, cbr, cbz and pdf documents without DRM."
arch=('any')
url="https://code.google.com/p/jeboorker/"
license=('GPL3')
install=jeboorker.install
depends=('xdg-utils' 'java-runtime>=7' 'unrar' 'rar')
source=("$pkgname-$pkgver.tar.gz"::"http://morologia.net/jeboorker/download.php?f=jeboorker_0.4.6.tar.gz")
md5sums=('dfa9a73d64cf228211ac1bda8ab63a50') #generate with 'makepkg -g'
changelog=ChangeLog

package() {
  cd "$srcdir/"
  mkdir -p ${pkgdir}/usr/share/java/jeboorker/lib mkdir ${pkgdir}/usr/share/java/jeboorker/lib/dropbox
  mkdir -p ${pkgdir}/usr/share/java/jeboorker/lib/epublib ${pkgdir}/usr/share/java/jeboorker/lib/jmupdf
  mkdir -p ${pkgdir}/usr/share/applications/
  mkdir -p ${pkgdir}/usr/share/doc/jeboorker/license/
  mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/share/pixmaps/
  pwd
  install -m644 jeboorker/lib/*.jar "${pkgdir}/usr/share/java/jeboorker/lib/"
  install -m755 jeboorker/*.sh "${pkgdir}/usr/share/java/jeboorker/"
  install -m644 jeboorker/lib/dropbox/* "${pkgdir}/usr/share/java/jeboorker/lib/dropbox/"
  install -m644 jeboorker/lib/epublib/* "${pkgdir}/usr/share/java/jeboorker/lib/epublib/"
  install -m644 jeboorker/lib/jmupdf/* "${pkgdir}/usr/share/java/jeboorker/lib/jmupdf/"
  install -m644 applications/jeboorker.desktop "${pkgdir}/usr/share/applications/"
  install -m644 doc/jeboorker/license/* "${pkgdir}/usr/share/doc/jeboorker/license/"
  install -m644 pixmaps/* "${pkgdir}/usr/share/pixmaps/"
}
