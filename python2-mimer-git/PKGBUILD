# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-mimer-git
pkgver=20130922
pkgrel=1
pkgdesc="Python mimetype library"
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/FriendCode/mimer/"
license=('Apache')
source=(${pkgname%-git}::git+https://github.com/FriendCode/mimer)
sha256sums=('SKIP')
provides=('mimer' 'python2-mimer')
conflicts=('mimer' 'python2-mimer')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
