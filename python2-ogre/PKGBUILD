# Maintainer: Saltire Sable <saltiresable at gee mail dot com>
pkgname=python2-ogre
pkgver=1.7.2
_rev=r1131M
_pyver=2.7
pkgrel=1
pkgdesc="High performance gaming and graphics library for Python"
arch=('any')
url="http://www.pythonogre.com"
license=('MIT')
depends=('python2>=2.7' 'ogre')
makedepends=('p7zip')
options=(!emptydirs)
source=('http://downloads.sourceforge.net/project/python-ogre/Latest/1.7.2/ogre-1.7.2-r1131M-py-2.7.7z')
md5sums=('d4ea55d1c15e398d6401049b6096c080') #generate with 'makepkg -g'

build() {
  cd ${srcdir}
  7z x ogre-$pkgver-$_rev-py-$_pyver.7z
  install -D -m644 docs/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  python2 setup.py install --root=${pkgdir} --optimize=1
}
