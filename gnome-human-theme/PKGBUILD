# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
# Contributor Shae Smittle <starfall87@gmail.com>

pkgname=gnome-human-theme
_pkgname=human-theme
pkgver=0.39.2
pkgrel=1
pkgdesc="Ubuntu's default theme"
arch=('i686' 'x86_64')
url="http://www.ubuntu.com"
license=('custom:cc-by-sa-2.5')
depends=('gtk-engine-murrine' 'humanity-icons')
makedepends=('python2' 'intltool' 'python-distutils-extra')
source=(http://archive.ubuntu.com/ubuntu/pool/main/h/human-theme/human-theme_${pkgver}.tar.gz)
md5sums=('e3315705ac685061a25ade73c0617d20')

package() {
cd "${srcdir}/${_pkgname}-${pkgver}"
python2 setup.py install --prefix=${pkgdir}/usr
# Copy over the license
install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
