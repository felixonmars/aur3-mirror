# Contributor: Thore Bunde <root@netpimp.de>
# Contributor: sh0 <mee@sh0.org>

_pkgname=wmii
pkgname=wmii2
pkgver=2.5.2
pkgrel=1
pkgdesc="Next generation WMI (Window Manager Version 2)"
arch=('i686' 'x86_64')
license=('MIT')
url="http://wmii.suckless.org/"
#depends=('glibc' 'libx11' 'libixp' 'dmenu' 'libxt')
depends=('glibc' 'libx11' 'libxt' '9base')
options=('!makeflags')
provides=('wmii2')
conflicts=('wmii')
source=(http://dl.suckless.org/${_pkgname}/$_pkgname-$pkgver.tar.gz)
md5sums=('61677e625be99732860e423b7074127f')

build() {
  cd $srcdir/$_pkgname-$pkgver
  sed -i -e 's?PREFIX = /usr/local?PREFIX = /usr?g' \
        -e 's?CONFPREFIX = ${PREFIX}/etc?CONFPREFIX = /etc?g' \
        -e 's?9PREFIX = ${PREFIX}/9?9PREFIX = /opt/plan9?g' config.mk
  make || return 1
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/wmii/LICENSE
  # Rid paths of temporary install directory.
}

