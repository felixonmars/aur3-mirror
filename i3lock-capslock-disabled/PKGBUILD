# Maintainer: hired777 <hired777[at]gmail[dot]com>
pkgname=i3lock-capslock-disabled
_originalname=i3lock
pkgver=2.4.1
pkgrel=2
license=('MIT')
pkgdesc="An improved screenlocker based upon XCB and PAM. Disable CapsLock status."
url="http://i3wm.org/i3lock/"
arch=('x86_64' 'i686')
depends=(xcb-util-image  xcb-util-keysyms  pam  libev  cairo)
conflicts=(i3lock)
source=("http://i3wm.org/${_originalname}/${_originalname}-${pkgver}.tar.bz2"
        "disableCapsLock.patch")
md5sums=('fbc954133a6335be89e394d9ec85fcfd'
         'ef8cce0116949b6349b1bd5c19e3a868')

build() {
  cd "${srcdir}/${_originalname}-${pkgver}"
  patch -p1 -i $srcdir/disableCapsLock.patch
  make
}

package() {
  cd "${srcdir}/${_originalname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
