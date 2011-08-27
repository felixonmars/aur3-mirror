# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=phonoripper
pkgver=0.11.2
pkgrel=1
pkgdesc="PhonoRipper is an easy to use, all-in-one GUI tool for creating audio CDs from analog sources like vinyl records."
arch=('i686' 'x86_64')
url="http://klappnase.bubble.org/phonoripper/index.html"
license=('GPL2')
depends=('cdrdao' 'normalize' 'pil>=1.1.5' 'python>=2.3' 'snack>=2.2.2' 'tcl>=8.4' 'tkimg' 'tktreectrl>=2.1')
source=(http://klappnase.bubble.org/download/$pkgname-$pkgver.tar.bz2)
md5sums=('ea34152bd306ea158286b3f6541b5749')

build() {

  cd $srcdir
  mkdir -p $pkgdir/opt/$pkgname-$pkgver
  cp -R $pkgname-$pkgver/ $pkgdir/opt

   # Desktop icon
   cd ./$pkgname-$pkgver/icons
   install -Dm644 phonoripper.png $pkgdir/usr/share/pixmaps/phonoripper.png
   install -Dm644 $startdir/phonoripper.desktop $pkgdir/usr/share/applications/phonoripper.desktop
}