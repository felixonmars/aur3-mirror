# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>
pkgname='gitpython'
pkgver=0.3
pkgrel=1
pkgdesc="GitPython is a python library used to interact with Git repositories."
arch=('any')
url="https://github.com/gitpython-developers/GitPython"
license=('BSD')
depends=('python2-distribute')
makedepends=('python2')
source=('https://github.com/gitpython-developers/GitPython/archive/0.3.tar.gz')
md5sums=('6f9e31199fedc43c542bccbc5cfd2113')

build() {
  msg 'Replacing python shebang by python2 shebang ...'
  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;
}

package() {
  cd "$srcdir/GitPython-$pkgver" || return 1

  msg 'Running setup.py'
  python2 setup.py install --root "$pkgdir" || return 1

  msg 'Installing license'
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkname}/LICENSE
}

# vim:set ts=2 sw=2 et: 
