# Contributor: Jon Wilson <bugs@erentil.net>

pkgname=python-crack
pkgver=0.5.1
pkgrel=2
pkgdesc="Python bindings for cracklib."
depends=('python' 'glibc' 'cracklib')
license=('MIT/X')
url="http://www.nongnu.org/python-crack/"
source=(http://download.savannah.gnu.org/releases/python-crack/python-crack-$pkgver.tar.gz)
md5sums=('0a0cadc8679e8dcb052dd9c22a5e032e')
options=('')
arch=('i686' 'x86_64')
build()
{
  cd $startdir/src/$pkgname-$pkgver || return 1

  DEFAULT_DICTPATH=/usr/share/cracklib/pw_dict ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

}
