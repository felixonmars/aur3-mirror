# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Michael Weber <michael@xmw.de>
pkgname=swclock
pkgver=1
pkgrel=2
epoch=
pkgdesc="Sets the local clock from an given file"
arch=(any)
url="http://xmw.de"
license=('GPL')
source=(swclock)
md5sums=('a5e19ae8b45ec39c23eaeb6b4e46bff6')

build() {
  :;
}


package() {
  install -m 755 -D swclock "$pkgdir/"etc/rc.d/$pkgname
}

# vim:set ts=2 sw=2 et:
