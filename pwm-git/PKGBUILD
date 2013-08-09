# Maintainer: Michael Bitzi <mibitzi@gmail.com>

pkgname=pwm-git
pkgver=126.f0721c0
pkgrel=1
pkgdesc='A simplistic tiling window manager'
arch=('i686' 'x86_64')
url='https://github.com/mibitzi/pwm'
license=('MIT')
makedepends=('git')
depends=('python' 'python-cffi' 'libxcb' 'xcb-util' 'cairo')
source=('git://github.com/mibitzi/pwm.git')
md5sums=('SKIP')

_gitname=pwm

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd $_gitname
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root=${pkgdir} --optimize=1
}
