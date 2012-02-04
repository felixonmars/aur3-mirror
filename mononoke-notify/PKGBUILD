# Contributor: Arnaud Barisain Monrose <dreamteam69@gmail.com>
pkgname=mononoke-notify
pkgver=20070217
pkgrel=1
pkgdesc="Tray menu for managing mononoke-bt account."
arch=('i686' 'x86_64')
url="http://reanimaction.free.fr/mbt/stats/mononoke-notify-2_20070217.tar.bz2"
license=('GPL')
if [ "${CARCH}" = "x86_64" ]; then
    depends=('lib32-qt>=4.2')
elif [ "${CARCH}" = "i686" ]; then
    depends=('qt>=4.2')
fi
conflicts=()
source=('http://reanimaction.free.fr/mbt/stats/mononoke-notify-2_20070217.tar.bz2')
md5sums=('2e1312066481f0e4eae7837c7b6aa405')

build() {
  cd "$srcdir/mononoke-notify-2"
  cmake .
  make
  mkdir -p $startdir/pkg/usr/bin/
  install -D -m655 src/mononoke-notify $startdir/pkg/usr/bin/  
}

# vim:set ts=2 sw=2 et:
