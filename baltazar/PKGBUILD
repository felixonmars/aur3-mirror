# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=baltazar
pkgver=0.2.1
pkgrel=2
pkgdesc="A program for RapidShare free users and Youtube video download"
arch=('i686' 'x86_64')
url="http://www.njsoft.iz.rs/baltazar/en/"
license=('GPL2')
depends=('pygtk' 'python-mechanize')
source=(http://www.fileden.com/files/2007/8/23/1373806/download/$pkgname.tar.gz)
md5sums=('df8184262ead3210b098e592e4d51dea')

build() {
  cd $srcdir/$pkgname
  install -m755 -D bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -m644 -D $pkgname.png $pkgdir/usr/share/icons/$pkgname.png
  install -m644 -D $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -m755 -d $pkgdir/usr/share/$pkgname/types
  install -m644 *.{png,glade,py} $pkgdir/usr/share/$pkgname/
  install -m644 types/*.png $pkgdir/usr/share/$pkgname/types/
}

