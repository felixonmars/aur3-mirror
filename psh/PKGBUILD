# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Leif Thande <leif.thande@gmail.com>

pkgname=psh
pkgver=1.0
pkgrel=1
pkgdesc="Perl interactive shell"
url="http://uazu.net/freeware/psh/"
license=('GPL')
depends=('perl')
arch=('i686' 'x86_64')
source=("http://uazu.net/freeware/psh/psh.tgz")
md5sums=('4a3b2bab5f4040e3a684630d9a606f29')

package() {
  cd $srcdir/psh
  mkdir -p $pkgdir/usr/bin/
  install -m 755 psh $pkgdir/usr/bin/
}
