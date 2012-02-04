# Maintainer: Joe Lightning <joe@joelightning.com>
pkgname='compa'
pkgver='0.98'
pkgrel='1'
pkgdesc="A Gnome panel applet that displays the output of a system command."
arch=('any')
url="http://code.google.com/p/compa/"
license=('GPLv2')
depends=('gnome-panel')
install='hint.install'
source=("http://compa.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('41af30b588d1d8d3a2d8a6afcdf3008e') #generate with 'makepkg -g'

function build
{
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

function package
{
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
