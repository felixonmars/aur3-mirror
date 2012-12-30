# Maintainer: eightballbill  <guglielmo.deconcini [at] gmail (dot) com>

pkgname=yawol
pkgver=20121811
pkgrel=1
pkgdesc="A minimalistic utility to send Wake On Lan packets"
arch=('i686' 'x86_64')
url="http://code.google.com/p/yawol/"
license=("GPLv3")
makedepends=('mercurial' 'python2-distribute')
depends=('python2' 'wxpython')

build() {
true
}

package() {
cd $srcdir
hg clone https://code.google.com/p/yawol/
cd yawol
python2 setupLinux.py install --root=$pkgdir
}
