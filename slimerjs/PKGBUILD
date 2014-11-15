# Maintainer: sirajul147 <siraj [dot] mussafirr [at] gmail[dot] com>
# Contributor: L42y <423300@gmail.com>
pkgname=slimerjs
pkgver=0.9.3
pkgrel=1
pkgdesc="A PhantomJS-like tool running Gecko"
arch=('i686' 'x86_64')
url="http://slimerjs.org/"
license=(custom:'MPL2.0')
depends=(xulrunner)
optdepends=('xorg-server-xvfb: run slimerjs without the need of an X-Windows environment')
source=(http://download.$pkgname.org/releases/$pkgver/$pkgname-$pkgver.zip)
md5sums=('b894bc6be3f301136d371b16e2c49c04')

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 application.ini $pkgdir/usr/lib/$pkgname/application.ini
  install -Dm644 omni.ja $pkgdir/usr/lib/$pkgname/omni.ja
  install -Dm755 $pkgname $pkgdir/usr/lib/$pkgname/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/usr/bin
  ln -s /usr/lib/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
