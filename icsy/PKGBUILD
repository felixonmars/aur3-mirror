# Contributor: JWC < bulk aaattt jwcxz dddoottt c0m >
pkgname=icsy
pkgver=0.9
pkgrel=2
pkgdesc="An alarm that prevents you from falling back asleep"
arch=('i686' 'x86_64')
url="http://jwcxz.com/projects/icsy"
license=('custom')
depends=('python')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('2a72c264f55fc4c9c0cd903e16798284')

build() {
		msg "Nothing to compile for $pkgname"
}

package() {
		cd $srcdir/$pkgname/
        sed -i "1s/python/python2/" icsy
		install -Dm755 icsy $pkgdir/usr/bin/icsy
		install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
