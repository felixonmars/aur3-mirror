# Maintainer: Gabriel Simoes <simoes.sgabriel@gmail.com>
pkgname=periscope-nemo
pkgver=0.2.6+git20131202
pkgrel=2
pkgdesc="Integration of Periscope in Nemo menus."
arch=(any)
url="https://launchpad.net/~webupd8team/+archive/ubuntu/subtitle-utils/"
license=(LGPL)
depends=('periscope' 'nemo-python' 'nemo' 'pyxdg')
conflicts=()
source=("https://launchpad.net/~webupd8team/+archive/ubuntu/subtitle-utils/+files/periscope-nemo_${pkgver}-${pkgrel}~webupd8~vivid0_all.deb")
md5sums=('00981fb3f7b1322807ddcb5079430556')

package() {
  tar -xvf ${srcdir}/data.tar.xz
  install -Dm755 "${srcdir}/usr/share/nemo-python/extensions/periscope-nemo.py" "${pkgdir}/usr/share/nemo-python/extensions/periscope-nemo.py"
}
