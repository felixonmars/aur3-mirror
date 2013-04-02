# Maintainer : giacomogiorgianni@gmail.com
# Contributor: SpepS <dreamspepser at yahoo dot it>

_name=dfm
pkgname=dino-dfm
pkgver=0.5
pkgrel=3
pkgdesc="A Qt Simple File Manager"
arch=('i686' 'x86_64')
url="http://dfm.sourceforge.net/"
license=('GPL3')
depends=('qt4')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/dfm/src/Dino_src-$pkgver.tar.gz")
md5sums=('74fad2bd950825e2902e998b312604c2')

build() {
  cd "$srcdir/$_name-$pkgver"

  # locale path fix
  sed -i 's|qApp.*Path()|QString("/usr/share/locale")|' main.cpp

  qmake-qt4 Dino.pro
  make 
  lrelease-qt4 Dino.pro
}

package() {
  cd "$srcdir/$_name-$pkgver"

  # bin
  install -Dm755 Dino \
    "$pkgdir/usr/bin/dino"

  # desktop file
  install -Dm644 dino.desktop \
    "$pkgdir/usr/share/applications/dino.desktop"

  # icon
  install -Dm644 dino.png \
    "$pkgdir/usr/share/pixmaps/dino.png"

  # translations
  #install -d "$pkgdir/usr/share/locale"
  #install -Dm644 translations/*.ts \
  # "$pkgdir/usr/share/locale"
   install -d "$pkgdir/usr/share/Dino/translations"
   install -Dm644 translations/*.qm \
    "$pkgdir/usr/share/Dino/translations"
}
