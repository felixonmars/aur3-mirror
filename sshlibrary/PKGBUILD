# Contributor: Thomas Robinson <robinsthom@gmail.com>
pkgname=sshlibrary
pkgver=1.0
pkgrel=1
pkgdesc="A test library for Robot Framework that enables SSH and SFTP"
arch=('i686' 'x86_64')
url="http://code.google.com/p/robotframework-sshlibrary/"
license=('APACHE')
depends=('python2' 'pycrypto' 'python-paramiko')
optdepends=('trilead: use with jython instead of paramiko')
source=("http://robotframework-sshlibrary.googlecode.com/files/SSHLibrary-$pkgver.tar.gz")
md5sums=('f92c592b077764daf53c3f578599018e')

build()
{
  cd "$srcdir/SSHLibrary-$pkgver"
  python2 setup.py install --root=$startdir/pkg
}
