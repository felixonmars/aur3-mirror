# Maintainer: Nathan Owens <ndowens @ archlinux dot us>
pkgname=textapp
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI client for app.net social media"
arch=('any')
url="http://www.floodgap.com/software/texapp/"
#License available at http://www.floodgap.com/software/ffsl/license.txt
license=('ffsl')
depends=('perl'
         'curl')
optdepends=('perl-term-readline-ttytter: readline support')
#Including 'binary' since each download may not reflect actual version
source=('textapp'
        'textapp.sh')
md5sums=('23ef1d0e9d1421b473066662b10e662d'
         'f1951dac51265a95e2f15eb0c1ef1fc0')

build() {
	echo > /dev/null
}

package() {
	cd "$srcdir/"
	install -d $pkgdir/usr/{share/$pkgname,bin}
	install -Dm644 textapp $pkgdir/usr/share/$pkgname
	install -Dm755 textapp.sh $pkgdir/usr/bin/textapp	
}
