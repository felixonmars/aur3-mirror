pkgname=udiskie-open-action
pkgnameorig=udiskie
pkgver=0.6.3
pkgrel=1
pkgdesc="Removable disk automounter using udisks, including a notification action to open folder with the default File Manager"
arch=('any')
url="https://pypi.python.org/pypi/udiskie"
license=('MIT')
depends=('udisks' 'python2-dbus' 'python2-gobject2' 'python2-notify' 'python2-setuptools')
makedepends=('asciidoc')
optdepends=('zenity: for luks decryption')
options=(!emptydirs)
replaces=('python2-udiskie' 'udiskie')
conflicts=('udiskie')
source=("https://pypi.python.org/packages/source/${pkgnameorig:0:1}/$pkgnameorig/$pkgnameorig-$pkgver.tar.gz"
	add_open_action.patch)
md5sums=('7dd7b44b7c87a267a6ae2cdcf787d9a7'
	 '6160c3a7f008a3e075cecfb62c5b0335')

package() {
  cd "$srcdir/$pkgnameorig-$pkgver"
  patch -p2 -i ../add_open_action.patch

  python2 setup.py install --root="$pkgdir" --optimize=1

  make -C doc
  install -m 0644 -D "doc/${pkgnameorig}.8" "$pkgdir/usr/share/man/man8/${pkgnameorig}.8"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgnameorig/LICENSE"

}

# vim:set ts=2 sw=2 et:
