# Contributor: oldbay <old_bay@mail.ru>

pkgname=habratray
pkgver=0.1
pkgrel=git
pkgdesc="HabraTray informer to http://habrahabr.ru"
arch=('i686' 'x86_64')
url="https://github.com/valualit/HabraTray/"
license=('GPL')
depends=('qt')
makedepends=('git' 'make' 'gcc')
source=('habratray.desktop' 'habratray.png')

build() {
  
  cd $srcdir
  git clone $url

  cd $srcdir/HabraTray
  find . -name .git -print0 | xargs -0 rm -rf
  qmake
  make
  
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  mkdir ${pkgdir}/usr/share
  mkdir ${pkgdir}/usr/share/applications
  mkdir ${pkgdir}/usr/share/pixmaps
  
  install -D -m755 ${srcdir}/HabraTray/habr ${pkgdir}/usr/bin/habr
  install -D -m644 ${srcdir}/habratray.desktop ${pkgdir}/usr/share/applications/habratray.desktop
  install -D -m644 ${srcdir}/habratray.png ${pkgdir}/usr/share/pixmaps/habratray.png

}
md5sums=('050fe65c42f8c6a81130cc4c5f0c47b5'
         '315fdd4b742702e33b95e87063297581')
