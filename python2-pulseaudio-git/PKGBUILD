# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname="python2-pulseaudio-git"
pkgver=0
pkgrel=1
pkgdesc="Simple bindings to PulseAudio's volume control interfaces."
arch=any
url="https://github.com/sbillaudelle/python-pulseaudio"
license=('LGPL')
depends=('python2' 'libpulse')
makedepends=('git')
provides="python2-pulseaudio"
source="git+ssh://git@github.com/sbillaudelle/python-pulseaudio.git"
md5sums=('SKIP')

pkgver() {
  cd local_repo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/python-pulseaudio
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
