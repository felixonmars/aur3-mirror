# Maintainer: Daniel Narvaez <dwnarvaez@gmail.com> 

pkgname=sugar-git
pkgver=v0.99.4.2.g988cbde
pkgrel=2
pkgdesc="Sugar Learning Platform"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/"
license=('GPL')
depends=('python2' 'gtk3' 'sugar-toolkit-gtk3-git' 'gstreamer' 'libwnck3'
         'libsoup' 'gtksourceview3' 'libxklavier' 'python2-gwebsockets-git'
         'metacity' 'gnome-keyring')
makedepends=('git')
install=sugar.install
source=("$pkgname"::'git://github.com/sugarlabs/sugar.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --tags --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --disable-schemas-compile
  make
}

package() {
  cd ${srcdir}/${pkgname}

  export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1
  make DESTDIR="$pkgdir" install
  unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"

  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
    --domain sugar ${pkgdir}/etc/gconf/schemas/*.schemas

  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
