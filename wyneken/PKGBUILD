# Contributor: Brian Nguyen <bhnguyen@gmail.com>

pkgname=wyneken
pkgver=0.5.2
pkgrel=1
pkgdesc="Content-oriented text processor built on LaTeX"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wyneken/"
license=('GPLv2')
depends=('python2-imaging' 'python2-pyqt' 'qt4' 'texlive-bin')
install=wyneken.install
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('8ab0acfd06e92f579dd1d0f4faf47d68')

package() {
  cd $srcdir/$pkgname-$pkgver

  python2 ./setup.py install --root=${pkgdir}
}
