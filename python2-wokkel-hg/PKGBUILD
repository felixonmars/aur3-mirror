# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributer: Wido <widomaker2k7@gmail.com>

pkgname=python2-wokkel-hg
pkgver=187
pkgrel=1
pkgdesc="Twisted Jabber support library muc client support"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
arch=('any')
makedepends=('python2-distribute' 'mercurial')
depends=('twisted' 'python2-dateutil')
provides=('python2-wokkel=0.7.2')
conflicts=('python2-wokkel')

source=('hg+http://hg.ik.nu/wokkel')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/wokkel"
  hg identify -n
}

package() {
  cd "$srcdir/wokkel"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
