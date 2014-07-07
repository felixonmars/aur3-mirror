# Maintainer: Ramon Arriaga <ramon.arriaga@gmail.com>
# Contributor: Perberos <perberos@gmail.com>
# Contributor: Prurigro <prurigro@gmail.com>

pkgname=nautilus-kill-thumbs
pkgver=1.2
pkgrel=2
pkgdesc="Nautilus extension for auto-deleting Windows' Thumb files cache, for Gnome 3"
url="http://gtk-apps.org/content/show.php/Nautilus+Extension+Kill+Thumbs?content=92143"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('nautilus>=3.0')
source=("http://perberos.com.ar/uploads/gnu-linux/${pkgname}/${pkgname}.tar.gz")
sha512sums=('ed490598281fefc0dc422668a0f07c40761b75bb48e73cba3b2de082686a740a4c481e3cbb410eea5de864290da81b0055acfde32d8646e6a17a33b86d3755f6')

build() {
    make
}

package() {
    install -Dm755 kill-thumbs.so ${pkgdir}/usr/lib/nautilus/extensions-3.0/lib${pkgname}.so
}
