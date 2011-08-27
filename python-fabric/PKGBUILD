# Maintainer: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=python-fabric
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library and command-line tool designed to streamline deploying applications or performing system administration tasks via the SSH protocol."
url="http://fabfile.org/"
license=('BSD')
arch=('any')
depends=('pycrypto' 'python2>=2.5' 'python-paramiko')
makedepends=('python2-distribute')
source=("http://code.fabfile.org/projects/fabric/files/Fabric-$pkgver.tar.gz")
md5sums=('9471af5fbda54318031f9ad6025e885d')

build() {
  cd $srcdir/Fabric-$pkgver
  python2 setup.py install --root=$startdir/pkg

  install -D -m644 README ${pkgdir}/usr/share/doc/${pkgname}/README
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
