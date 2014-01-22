
pkgname=darkscreen
pkgver=0.1
pkgrel=1
pkgdesc="A simple utility to darken one of your monitors, so you can concentrate on other."
url="https://github.com/stereohead/darkscreen"
arch=('any')
license=('GPL')
depends=('python2' 'wxpython')
source=("darkscreen.py")
md5sums=('bb3147c5b668defe93ed79ef12cf62f4')

package(){
	cd "$srcdir"
	install -Dm 755 darkscreen.py "$pkgdir/usr/bin/darkscreen"
}
