# Maintainer: rafmav <rafmav@free.fr>
pkgname=biwascheme
pkgver=0.6.2
pkgrel=1
pkgdesc="Scheme interpreter written in JavaScript."
arch=(i686 x86_64)
url="http://www.biwascheme.org/"
license=('MIT' 'GPL2')

source=(https://github.com/biwascheme/biwascheme/blob/master/release/biwascheme-$pkgver-min.js)
source=(https://github.com/biwascheme/biwascheme/blob/master/release/biwascheme-$pkgver.js)

md5sums=('81e69ce19db9d6158a9153b067cd6374') # pkg.min
md5sums=('83b4208798bbdc9c5913a0a0f8e53f6f') # pkg

package() {
    mkdir -p $pkgdir/usr/share/$pkgname
    cd $srcdir
    install $pkgname-$pkgver.js $pkgdir/usr/share/$pkgname
    install $pkgname-$pkgver-min.js $pkgdir/usr/share/$pkgname
    ln -s $pkgdir/usr/share/$pkgname/$pkgname-$pkgver.js $pkgdir/usr/share/$pkgname/$pkgname.js
    ln -s $pkgdir/usr/share/$pkgname/$pkgname-$pkgver-min.js $pkgdir/usr/share/$pkgname/$pkgname.min.js
}

