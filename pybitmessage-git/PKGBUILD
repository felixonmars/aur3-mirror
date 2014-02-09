# Maintainer: Andreas Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Asta <gatien.bovyn@gmail.com>
# Contributor: ptrv <mail@petervasil.net>

_pkgname=pybitmessage
pkgname=${_pkgname}-git
pkgver=0.4.2.r7.g44f31d7
pkgrel=1
pkgdesc="Bitcoin inspired P2P encrypted messenger"
arch=('any')
depends=('hicolor-icon-theme' 'python2' 'python2-pyqt' 'qt4')
makedepends=('git')
optdepends=('python2-gevent')
url="https://github.com/Bitmessage/PyBitmessage"
license=('MIT')
source=($pkgname::git+https://github.com/Bitmessage/PyBitmessage
        pybitmessage.sh)
sha256sums=('SKIP'
            'c20eeeffd4931d8bcd50de5e6e1a974323ebbd3f5ad1d34483c6adeb3b5f3ae1')
provides=('pybitmessage')
conflicts=('pybitmessage')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd $pkgname

  msg 'Installing shared files...'
  mkdir -p "$pkgdir"/usr/share/${_pkgname}
  cp -R src/* "$pkgdir"/usr/share/${_pkgname}

  msg 'Installing desktop icons...'
  install -D -m644 desktop/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 src/images/can-icon-24px.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_pkgname}.png"
  install -D -m644 desktop/can-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -D -m644 desktop/can-icon.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

  msg 'Installing executable...'
  install -D -m755 ${srcdir}/pybitmessage.sh "${pkgdir}/usr/bin/pybitmessage"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

