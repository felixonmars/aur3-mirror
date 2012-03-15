# Contributor: mathieu bultel <mat.bultel@gmail.com>
pkgname=robotframework-2.7
pkgver=2.7
pkgrel=2
pkgdesc="A keyword-driven test automation framework"
arch=('i686' 'x86_64')
url="http://www.robotframework.org"
license=('APACHE')
depends=('python2')
optdepends=('jython: for using robotframework with Java')
source=("http://robotframework.googlecode.com/files/$pkgname.tar.gz")
md5sums=('83ed240ef88873f7de3b1e356c3b3519')

build() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1 
}
