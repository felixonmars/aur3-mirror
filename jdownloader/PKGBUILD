# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=jdownloader
pkgver=0.3.3
pkgrel=1
pkgdesc="A download manager for one-click hosting sites"
arch=('any')
url="http://jdownloader.org/"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'hicolor-icon-theme'
         'java-runtime' 'shared-mime-info')
makedepends=('imagemagick')
optdepends=('kdebase-kdialog: notification support'
            'libnotify: notification support')
install=$pkgname.install
source=("jd-linux-$pkgver.tar.gz"::"https://github.com/asergi/jd-linux/archive/v$pkgver.tar.gz")
sha1sums=('88c7980ff54ad9446cf36ce4852d97adf5c443aa')

build() {
  cd "$srcdir/jd-linux-$pkgver"

  make
}

package() {
  cd "$srcdir/jd-linux-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
