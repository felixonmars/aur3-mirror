# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python2-yowsup-git'
pkgver=b7c606c
pkgrel=1
pkgdesc="The open source cross platform Whatsapp library powering Wazapp"
url="https://github.com/tgalal/yowsup"
arch=('any')
license=('MIT')
depends=('python2' 'python2-dateutil')
source=('git+https://github.com/tgalal/yowsup'
        'https://github.com/mgehre/yowsup/raw/master/setup.py')
sha512sums=('SKIP'
            '6235ca26d7b6ba10ecac04624ecfd5809869a924eaf441e56b55cd7c331f99f0d33f0f01a39229b72e353e37a552861d9d478900f03a5cdbbe1b1eb4216d8e92')

pkgver() {
  cd "$SRCDEST/yowsup"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/yowsup"
  cp "$srcdir/setup.py" .
  sed -i 's/env python/env python2/g' setup.py
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
