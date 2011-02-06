# Contributor: rabyte <rabyte__gmail>

pkgname=gnome-whitenoise
pkgver=0.1.1
pkgrel=1
pkgdesc="A graphical frontend to the ambient random noise generator whitenoise"
arch=('i686' 'x86_64')
url="http://pessimization.com/software/whitenoise/"
license=('GPL2')
depends=('gnome-python>=2' 'whitenoise>=1')
source=(http://pessimization.com/software/whitenoise/$pkgname-$pkgver.tar.gz)
md5sums=('4ca8058299acb266f94b984276091e1e')

build() {
  cd $srcdir/$pkgname-$pkgver/src

  sed 's|GLADEDIR = "."|GLADEDIR = "/usr/share/gnome-whitenoise/lib"|g' -i Const.py

  mkdir -p $pkgdir/usr/{bin,share/$pkgname/lib}
  mv -f $pkgname $pkgdir/usr/bin/
  install -m644 * $pkgdir/usr/share/$pkgname/lib/
  install -m644 -D ../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

# vim:set ts=2 sw=2 et:
