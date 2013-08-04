# Author: Julien MISCHKOWITZ <wain@archlinux.fr>
# Author: tuxce <tuxce.net@gmail.com>

pkgname=fortune-hook
pkgver=1.0
pkgrel=1
pkgdesc="A hook to show quotes from the fortune program."
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=(GPL)
depends=('fortune-mod')
source=('fortune-hook.tar.gz')
md5sums=('58f82ac3f042981a1346a476edbd91b9')

build() { 
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"
  install -m 755 -d ${pkgdir}/usr/lib/initcpio/hooks
  install -m 755 -d ${pkgdir}/usr/lib/initcpio/install
  install -m 644 hooks/fortune ${pkgdir}/usr/lib/initcpio/hooks
  install -m 644 install/fortune ${pkgdir}/usr/lib/initcpio/install
}

# vim:set ts=2 sw=2 et:
