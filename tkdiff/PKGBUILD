# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=4.2
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tk')
conflicts=('tkcvs')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('efc19226416afe3e98e4a29c112cfc3e')

package() { 
  install -Dm755 "$srcdir/$pkgname-unix/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 
