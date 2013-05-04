# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=passphrase-git
_gitname='passphrase'
pkgver=8894184
pkgrel=2
pkgdesc="Securely computes a key from a passphrase and salt."
arch=('any')
depends=('python2' 'python2-passlib')
makedepends=('git')
url="https://github.com/theymos/passphrase"
license=('custom')
source=(git://github.com/theymos/passphrase.git
        LICENSE)
sha256sums=('SKIP'
            '03468bf15d7af6719c6fabc10351cee95faa068190002d76287c3bdc58ad4880')
provides=('passphrase')
conflicts=('passphrase')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd $_gitname

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd $_gitname

  msg 'Installing executable...'
  install -D -m755 passphrase.py "${pkgdir}/usr/bin/passphrase"

  msg 'Installing license...'
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
