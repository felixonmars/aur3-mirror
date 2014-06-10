# Maintainer: Ng Oon-Ee <n g  o o n  e e  DOT  t a l k AT g m a i l DOT c o m>

_pkgname=evernote-sdk-python
pkgname=$_pkgname-git
pkgver=r45.2afdbb3
pkgrel=1
pkgdesc="Evernote SDK for Python"
arch=('any')
url="https://github.com/evernote/evernote-sdk-python"
license=('MIT')
makedepends=('git' 'python2-setuptools')
source=("$_pkgname::git://github.com/evernote/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/"
  rm -R "$pkgdir/usr/lib/python2.7/site-packages/thrift/"
}
