#Contributor: janboe <janboe@gmail.com>
#Former contributor: wooptoo <wooptoo@gmail.com>

pkgname=firefox-form-widgets
pkgver=1
pkgrel=2
pkgdesc="Clearlooks-like form widgets for Firefox"
url="http://users.tkk.fi/~otsaloma/art/"
license="GPL"
arch=('i686' 'x86_64')
md5sums=('49cc80a33fb334deebe58091967de611'
         '86f8ab01a1f716efefc7ddd6ed30d760')
depends=('firefox')
install=(firefox-form-widgets.install)
source=(http://users.tkk.fi/~otsaloma/art/$pkgname.tar.gz
	'fix-form-widgets')

build() {
  mkdir -p $startdir/pkg/opt/mozilla/lib/firefox
  cp -r $startdir/src/$pkgname/res $startdir/pkg/opt/mozilla/lib/firefox
  install -D -m 0755 $startdir/src/fix-form-widgets $startdir/pkg/usr/bin/fix-form-widgets
}

