# Author: Victor Aurélio <victor.feradecs@gmail.com>
# Maintainer: Victor Aurélio <victor.feradecs@gmail.com>

pkgname=pyih-uploader
pkgver=0.1.9
pkgrel=1
pkgdesc="is small python2 program to upload images to imageshack."
arch=('any')
url="https://github.com/hotvic/pyih-uploader/"
license=('GPL3')
depends=('python2' 'python2-pycurl')
optdepends=('pygtk: Need to send to clipboard')
source=("https://github.com/hotvic/pyih-uploader/archive/v${pkgver}.tar.gz")
md5sums=('e26da9eea22a81f5636855f55747c63e')

package() {
	cd $srcdir/$pkgname-${pkgver}/

	chmod +x install.sh
	DESTDIR=$pkgdir/usr ./install.sh --prefix=/usr install
}
