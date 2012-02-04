# Contributor: bender02 at archlinux dot us
pkgname=time-drive
pkgver=0.4.0
pkgrel=3
pkgdesc="A GUI for duplicity, a backup app"
arch=('i686' 'x86_64')
url="https://launchpad.net/time-drive"
license=('GPL')
depends=('python2-qt' 'duplicity')
source=(http://launchpad.net/time-drive/0.4/0.4/+download/Time-Drive-$pkgver.tar.gz
        timedrive-validate_typo.diff)
md5sums=('5790e314c3b60dead58024ed2e44a83d'
         '7c6c8c1287d98def1a2af3afddfe8fb5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -Rp1 < ${srcdir}/timedrive-validate_typo.diff

  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}

  install -Dm644 README ${pkgdir}/usr/share/time-drive/README
}

# vim:set ts=2 sw=2 et:
