# Submitter: Ner0
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=terra
pkgver=0.1.7
pkgrel=5
pkgdesc="Python/GTK3 drop-down tiling terminal emulator"
arch=('any')
url="https://launchpad.net/terra"
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'vte3')
makedepends=('python2-distutils-extra')
source=("https://launchpad.net/~ozcanesen/+archive/terra-terminal/+files/${pkgname}_$pkgver~quantal1.tar.gz"
    fix.patch)
md5sums=('e973ccb6958a0d187f3b539f3c8d4dac'
    '83d4e1c2f0eaeeb49224d8b8f4c52deb')

prepare() {
  cd "${srcdir}/recipe-${pkgver}"
  patch -p1 < "${srcdir}/fix.patch"
}

package() {
  cd "${srcdir}/recipe-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1

  find "${pkgdir}/" -type f -not -name terra -exec chmod 644 '{}' \;
}
