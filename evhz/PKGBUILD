# Contributor: Mark Pustjens <pustjens@dds.nl>
pkgname=evhz
pkgver=1.0
pkgrel=1
pkgdesc="A tool that can display the current mouse refresh rate."
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20060623094750/http://homepages.nildram.co.uk/~kial/evhz.c"
license=('unknown')
depends=()
source=(evhz.c)
md5sums=('71cc39a6d80d8902be8e7f58356809bf')

build() {
  install -d ${pkgdir}/usr/sbin
  gcc -o evhz evhz.c
  install -m755 evhz ${pkgdir}/usr/sbin/evhz
}

# vim:set ts=2 sw=2 et:
