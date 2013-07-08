# Patch: hanny
# Submitter: Ner0
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
_pkgname=terra
pkgname=$_pkgname-solarized
pkgver=0.1.7
pkgrel=4
pkgdesc="Python/GTK3 drop-down tiling terminal emulator patched to use Solarized color palette"
arch=('any')
url="https://launchpad.net/terra"
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'vte3')
makedepends=('python2-distutils-extra')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://launchpad.net/~ozcanesen/+archive/terra-terminal/+files/terra_$pkgver~quantal1.tar.gz" "UseSolarized.patch")
md5sums=('e973ccb6958a0d187f3b539f3c8d4dac' '9793c1ba369fdb3edfad8c422e91e077')

package() {
  patch recipe-$pkgver/terra/VteObject.py $srcdir/UseSolarized.patch

  cd recipe-$pkgver

  python2 setup.py install --prefix=/usr --root="${pkgdir}/" --optimize=1

  find "${pkgdir}/" -type f -not -name terra -exec chmod 644 '{}' \;
}
