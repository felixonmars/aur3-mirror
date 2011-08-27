# Contributor: JWC < bulk aaattt jwcxz dddoottt c0m >
pkgname=gvcall
pkgver=1.0
pkgrel=1
pkgdesc="A utility for making calls with Google Voice and VoIP services using Linphone"
arch=('any')
url="http://jwcxz.com/projects/gvcall"
license=('custom')
depends=('python' 'python-pygooglevoice' 'linphone')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('d8c010285b80cfcfe2415efbb8d2f746')

build() {
		msg "Nothing to compile for $pkgname"
}

package() {
		cd $srcdir/$pkgname-$pkgver/
		install -Dm755 gvcall $pkgdir/usr/bin/gvcall
		install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
		install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README

		msg "It is recommended to read the README (or information on the website) at some point."
}
