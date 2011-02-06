# Contributor: Gary James <garyjames82@gmail.com>
pkgname=ripper
pkgver=007
pkgrel=2
pkgdesc="CD Ripper for the ROX desktop"
arch=('i686')
url="http://rox-ripper.googlecode.com"
license=('GPL')
depends=(rox-lib)
source=(http://rox-ripper.googlecode.com/files/Ripper-$pkgver.tgz)
md5sums=('6f90f80fc009e6b12418c004c11b5e3a')

build() {
  cd "$srcdir/Ripper"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "python /usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
