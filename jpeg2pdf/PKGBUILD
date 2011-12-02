# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>

pkgname=jpeg2pdf
pkgver=0.12
pkgrel=5
pkgdesc="Converts a directory of JPEG files to a PDF"
url="http://raa.ruby-lang.org/project/jpeg2pdf/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('ruby1.8')
source=("http://raa.ruby-lang.org/cache/$pkgname/$pkgname-0.1.tgz"
        'jpeg2pdf-use-ruby-1.8.patch')
md5sums=('5e49eb014d0526d75568766274824e91'
         '40706bd286018cac834dd060877fb4a4')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir/jpeg2pdf-use-ruby-1.8.patch"
	ruby-1.8 install.rb all --prefix="$pkgdir/opt/ruby1.8" --bindir="$pkgdir/usr/bin"
	rm "$pkgdir/usr/bin/test.rb"
}
