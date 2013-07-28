#Maintainer:  danyf90 <daniele.formichelli@gmail.com>
#Contributor: Erik Johnson (archtaku at gmail dot com)

pkgname=ksplash-arch-simple
pkgver=1.0
pkgrel=1
pkgdesc="Simple, yet elegant KDE4 splash screen"
arch=('any')
url=('http://iyanmv.com/')
license=('CCPL')
source=("http://kde-look.org/CONTENT/content-files/124033-arch-simple.tar.gz")
sha512sums=('a076a3c8fea897ec326496c87852b0161565aa324362e35ec58e37f738b0bdcda8789e6c49292c5bedee6b100ebe73e1a4189d577e6fc44bd4dfc6356278add8')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/apps/ksplash/Themes
  cp -r arch-simple $pkgdir/usr/share/apps/ksplash/Themes
}
