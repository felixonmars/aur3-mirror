# Contributor: John Gerritse <reaphsharc@gmail.com>
# Contributor: Josh Miller <josh@joshdmiller.com>
pkgname=celtx-bin64
pkgver=2.9.1
pkgrel=1
pkgdesc="Celtx is the world's first fully integrated solution for media pre-production and collaboration. (binary version for x86_64)"
arch=(x86_64)
url="http://celtx.com/"
license=('CePL')
depends=(libpng12)
options=('!strip')
conflicts=('celtx' 'celtx-bin')
install="celtx.install"
source=(http://download.celtx.com/2.9.1/Celtx-2.9.1-64.tar.bz2 'CePL-1.3.txt' 'celtx.desktop' 'celtx.install')
md5sums=('64228345d5c35a8f34c63778c042f26c'
         '998912d308020615adb0bcf22b845970'
         'c64e4173b5af998ffa158d3c085b996e'
         '38925b8d2b378dbe796bb1497a8f564e')

build() {
  # Copy binaries
  cd "${srcdir}/celtx"
  mkdir -p ${pkgdir}/opt/celtx
  cp -a ${srcdir}/celtx/* ${pkgdir}/opt/celtx/
  chmod a+x ${pkgdir}/opt/celtx/celtx
  chmod a+x ${pkgdir}/opt/celtx/celtx-bin

  # Install extra files
  install -D -m644 "${srcdir}/CePL-1.3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt" || return 1
  install -D -m644 "${srcdir}/celtx.desktop" "${pkgdir}/usr/share/applications/celtx.desktop" || return 1
}

# vim:set ts=2 sw=2 et:
