# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=meld-beta
_pkgname=meld
pkgver=3.11.0
pkgrel=3
pkgdesc="Visual diff and merge tool"
url='http://meldmerge.org/'
license=('GPL')
arch=('any')
license=('GPL')
depends=('gtk3' 'glib2' 'gtksourceview3' 'python2-gobject' 'gtk-update-icon-cache')
makedepends=('gnome-doc-utils' 'itstool')
provides=('meld')
conflicts=('meld')
install=$_pkgname.install
source=("http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('098e2b95b56f58da03a628f999ec3bbfdc619033de54e4ce41bbc475ea43f9f4')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/env python/env python2/' bin/meld
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
