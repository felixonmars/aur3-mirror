# Contributor: Jason Perry <sh.jperry at gmail dot com>
pkgname=urho3d-bin
pkgver=1.32
pkgrel=1
pkgdesc="Urho3D is a cross-platform 2D and 3D game engine. 64-bit shared binary release."
url="http://urho3d.github.io/"
arch=('x86_64')
license="MIT"
depends=('xorg-server-devel' 'libgl' 'libxrandr' 'alsa-lib')
makedepends=()
optdepends=('gcc' 'cmake')
source=("http://downloads.sourceforge.net/project/urho3d/Urho3D/${pkgver}/Urho3D-${pkgver}-Linux-64bit-SHARED.tar.gz")
md5sums=('7cf4d5193d6530fd8748c072c0d72093')

package() {
  install -d -m 0755 "${pkgdir}"/usr/include
  install -d -m 0755 "${pkgdir}"/usr/lib/pkgconfig
  install -d -m 0755 "${pkgdir}"/usr/share
  cd "${srcdir}"/Urho3D-"${pkgver}".0-Linux-64bit-SHARED
  cp -r --no-preserve=ownership include/Urho3D "${pkgdir}"/usr/include
  cp -r --no-preserve=ownership lib/Urho3D "${pkgdir}"/usr/lib
  install -m 644 lib/pkgconfig/Urho3D.pc "${pkgdir}"/usr/lib/pkgconfig/Urho3D.pc
  cp -r --no-preserve=ownership share/Urho3D "${pkgdir}"/usr/share
}
