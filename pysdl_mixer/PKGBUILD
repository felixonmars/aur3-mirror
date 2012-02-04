# $Id: PKGBUILD,v 1.2 2007/06/30 06:45:29 Snowman Exp $
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>

pkgname=pysdl_mixer
pkgver=0.0.3
pkgrel=2
pkgdesc="A pyrex interface SDL_mixer for python"
arch=('i686' 'x86_64')
url="https://gna.org/projects/pysdlmixer"
license=('GPL')
depends=('python' 'sdl_mixer')
source=(http://download.gna.org/pysdlmixer/$pkgname-$pkgver.tar.gz)
md5sums=('81d109f02938c6a1c368dd461252450a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py build
  python setup.py install --root=$startdir/pkg/
}
