# Modified from original gmpc pkgbuild created by tobias <tobias@archlinux.org>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=gmpc-notify-osd-plugin
realname=gmpc-notify-osd
pkgver=112536
pkgrel=1
pkgdesc="A package that adds the notify-osd support to gmpc."
arch=(i686 x86_64)
license="GPL"
url=http://gtk-apps.org/content/show.php/gmpc-notify-osd?content=112536
depends=('gmpc')
source=(http://gtk-apps.org/CONTENT/content-files/${pkgver}-${realname}.tar.gz)
md5sums=('5f545fe4c3745a357af3c2aaeeb06ee9')

build() {
  cd ${startdir}/src
  tar xzf ${pkgver}-${realname}.tar.gz
  cd $startdir/src/${realname}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
