# Contributor: Gary James <garyjames82@gmail.com>
pkgname=fetch
pkgver=0.3.3
pkgrel=1
pkgdesc="Download handler for ROX-Filer"
arch=('i686')
url="http://www.kerofin.demon.co.uk/rox/fetch.html"
license=('GPL')
depends=(rox)
source=(http://www.kerofin.demon.co.uk/rox/Fetch-$pkgver.tar.gz)
md5sums=('2a51987f646019578101b38f976d304d')

build() {
  cd "$srcdir/Fetch"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -R * "$pkgdir/usr/share/$pkgname"
  cp -R .DirIcon "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > $pkgdir/usr/bin/$pkgname
  echo "/usr/share/$pkgname/AppRun" >> $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
