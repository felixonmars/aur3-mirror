# Contributor: mathieu bultel <mat.bultel@gmail.com>
pkgname=selenium-library
pkgver=2.8.1
pkgrel=2
pkgdesc="SeleniumLibrary is a Robot Framework test library that uses Selenium web testing tool internally"
arch=('i686' 'x86_64')
url="http://robotframework-seleniumlibrary.googlecode.com/files/"
license=('APACHE')
depends=('python2' 'openjdk6')
source=("http://robotframework-seleniumlibrary.googlecode.com/files/robotframework-seleniumlibrary-$pkgver.tar.gz")
md5sums=('c89a18b7e2ac01ab9f279b75826c5580')

build()
{
  cd "$srcdir/robotframework-seleniumlibrary-$pkgver"
  python2 setup.py install --root=$startdir/pkg
}


