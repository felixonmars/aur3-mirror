# Contributor: JWC < bulk aaattt jwcxz dddoottt c0m >
pkgname=dotman
pkgver=0.12
pkgrel=3
pkgdesc="A config file manager for synchronizing multiple environments"
arch=('i686' 'x86_64')
url="http://jwcxz.com/projects/dotman"
license=('custom')
depends=('python-paramiko')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('b9f49231d20d54b177270946125797c7')

build() {
		msg "Nothing to compile for $pkgname"
}

package() {
		cd $srcdir/$pkgname/
        sed -i "1s/python/python2/" dotman.py
		install -Dm755 dotman.py $pkgdir/usr/bin/dotman
		install -Dm644 LICENSE $pkgdir/usr/share/licences/$pkgname
}
