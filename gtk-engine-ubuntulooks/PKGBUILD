# Contributor: Valeriy Lyasotskiy <onestep at ukr dot net>
# Contributor: Joe Davison <joe@warhaggis.com>

# I am sorry this is horrible. This was a quick hack to solve the fact original package 404'd.
# Orphaning after submission. Please fix.

pkgname=gtk-engine-ubuntulooks
pkgver=0.9.12
pkgrel=12
pkgdesc="Ubuntulooks is a modern-looking engine for GTK+2, based on Clearlooks and used in Ubuntu Linux"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/gutsy/gnome/gtk2-engines-ubuntulooks"
license=('GPL')
depends=('gtk2>=2.12.0')
makedepends=('pkgconfig')
source=(http://ftp.br.debian.org/debian/pool/main/u/ubuntulooks/gtk2-engines-ubuntulooks_0.9.12-2_amd64.deb)
md5sums=('90df9d14fda8ffd8afd7bc38ab59c026')
options=(!libtool)

build() {
  cd ${srcdir}/
tar -xvf data.tar.gz
cp -R usr $pkgdir

}
