# Maintainer: rufflove <nat.hulse@gmail.com>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>
# Contributor: Noctivivans <noctivivans@gmail.com>
# Contributor: benoror <benoror@gmail.com>

pkgname=gnome-window-applets
pkgver=0.3
pkgrel=1
pkgdesc="GNOME Panel applets that substitute maximized window title and buttons."
url="http://gnome-look.org/content/show.php?content=103732"
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://gnome-look.org/CONTENT/content-files/103732-$pkgname-$pkgver.tar.gz)
depends=('gconf' 'libwnck3')
makedepends=('intltool')
install='applets.install'
sha1sums=('bb145505da50b5ba2f38ed4d62bf032613e46f96')

build() {
        cd "${srcdir}"/${pkgname}-${pkgver}
        ./configure  --disable-schemas-install --prefix=/usr --libexecdir=/usr/lib/$pkgname --with-gconf-schema-file-dir=/usr/share/gconf/schemas
        make
}
package() {
        cd "${srcdir}"/${pkgname}-${pkgver}
        make DESTDIR=${pkgdir} install
}
