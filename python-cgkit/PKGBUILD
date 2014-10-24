# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Strandberg <esodax!nospam!@gmail.com>

_relname=cgkit
pkgname=python-$_relname
pkgver=2.0.0
pkgrel=1
pkgdesc='The Python Computer Graphics Kit (Python3.x)'
arch=('i686' 'x86_64')
url='http://cgkit.sourceforge.net'
license=('MPL' 'GPL' 'LGPL')
depends=('python3' 'boost')
makedepends=('scons')
optdepends=('lib3ds: to import/export 3DS files (cgkit require rebuild)'
            'python-protocols: for scene management used in various places'
            'python-opengl: required when doing OpenGL visualizations'
            'python-imaging: required whenever images have to be processed'
            'python-pygame: required when the viewer tool is used'
            'python-numpy: some modules support reading/writing numpy arrays'
            'python-pyode: for rigid body simulations using the ODEDynamics'
            'python-pyserial: for the FlockOfBirds component')
source=(http://downloads.sourceforge.net/project/$_relname/$_relname/$_relname-$pkgver/$_relname-$pkgver-py3k.tar.gz)
md5sums=('1068e25392f50b1baf4b16bbb571ea17')


build() {
  cd $srcdir/$_relname-$pkgver/supportlib
  scons
}

package() {
  cd $srcdir/$_relname-$pkgver
  python setup.py install --root=$pkgdir --prefix=/usr
}

# vim:ts=2:sw=2:et:
