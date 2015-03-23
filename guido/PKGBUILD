# Maintainer : Cian O'Connor <cian.oconnor at gmail dot com>

pkgname=guido
pkgver=1.56
pkgrel=1
pkgdesc="A formal language for score level music representation and a Qt editing suite."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/guidolib"
license=('MPL')
depends=('qt5-base' 'cairo')
optdepends=('pd: pure data support')
install="$pkgname.install"
source=("http://sourceforge.net/projects/guidolib/files/guidolib-$pkgver-src.tgz"
        "guidoeditor.desktop"
        "guidoscenecomposer.desktop"
        "guidoqtfontviewer.desktop")

build() {
  cd "$srcdir/guidolib-$pkgver-src"

  cd cmake && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make

  # Build Qt apps
  cd ../Qt 
  make unix
  # cd GuidoQtViewer && qmake && make 
}

package() {
  cd "$srcdir/guidolib-$pkgver-src/cmake"

  make DESTDIR="$pkgdir/" install

  # Install Qt apps
  install -Dm 755 ../Qt/bin/guidoeditor "$pkgdir/usr/bin/guidoeditor"
  install -Dm 755 ../Qt/bin/guidoscenecomposer "$pkgdir/usr/bin/guidoscenecomposer"
  install -Dm 755 ../Qt/bin/GuidoQtFontViewer "$pkgdir/usr/bin/guidoqtfontviewer"
  install -Dm 755 ../Qt/bin/guido2image "$pkgdir/usr/bin/guido2image"

  # Install guido score font
  install -Dm 644 ../src/guido2.ttf "$pkgdir/usr/share/fonts/TTF/guido2.ttf"

  # docs: 
  install -d "$pkgdir/usr/share/doc/guido"
  cp -a ../doc/[^doxygen]* "$pkgdir/usr/share/doc/guido"

  # Install examples
  install -d "$pkgdir/usr/share/$pkgname"
  cp -a ../gmn-examples "$pkgdir/usr/share/$pkgname"

  # Install desktop files and pixmaps
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/"*.desktop "$pkgdir/usr/share/applications"
  install -Dm644 ../Qt/GuidoSceneComposer/rsc/addFromFileGuido.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

md5sums=('d181e53f2b4bc80bf9d76e0a26339a3a'
         '8b4fe7dc4802ccffd7dbf62fbc29bf6a'
         '47fc38c558151973d45a5c8eb5fe5c67'
         '25ed9b380987bf793effabf7924fd606')
