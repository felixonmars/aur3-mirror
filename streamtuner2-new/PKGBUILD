# Contributor: wido <widomaker2k7@gmail.com>
# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=streamtuner2-new
pkgver=2.1.3
pkgrel=1
pkgdesc="An internet radio browser"
arch=('any')
url="http://sourceforge.net/projects/streamtuner2"
license=('custom')
depends=('python2' 'pygtk' 'python2-xdg' 'python2-pillow' 'python2-keybinder2' 'python2-lxml' 'python2-cssselect' 'python2-pyquery')
makedepends=('libarchive')
conflicts=('streamtuner' 'streamtuner2')
source=("http://downloads.sourceforge.net/sourceforge/streamtuner2/streamtuner2-${pkgver}.rpm")
#source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.rpm")
md5sums=('95ec6af8ad5d61420c8dc3c8a03fb73e')

package() {
  cd "${pkgdir}"
  bsdcpio -id -I "${srcdir}/streamtuner2-${pkgver}.rpm"
  # python2 fix
  sed -i 's:^#!.*/usr/bin/env.*python:#!/usr/bin/env python2:' "${pkgdir}/usr/bin/streamtuner2"
}
