# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Eduardo Reveles <me@osiux.ws>
# Contributor: Shem Valentine <archlinux@valentinenews.net>
# Contributor: Lael Guillemenot <zeppelinlg@gmail.com>

pkgname=glippy-bzr
pkgver=r39
_majorver=1.0
pkgrel=1
pkgdesc="not so simple clipboard manager for GNOME (bzr version with appindicator enabled)"
arch=('i686' 'x86_64')
url="https://launchpad.net/glippy"
license=('GPL')
depends=('mono' 'gnome-sharp')
makedepends=('automake' 'bzr')
provides=('glippy=$pkgver' '$pkgname')
options=(!emptydirs)
conflicts=('glippy')
install=${pkgname%-*}.install
source=('bzr+lp:glippy'
        'enable-indicator.patch')
sha512sums=('SKIP'
            '2cbd7728437cbb046b6b739669a5ee0b066fef54f9d152c8fc22e2aae988a852ceb445709c5770ecb0fb241580f0adbe5271afb1cd721800e97ea9f3d977007c')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s" "$(bzr revno)"
}

prepare() {
  cd "${srcdir}"
  patch -p0 -i "${srcdir}/enable-indicator.patch"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  #Using last autoconf
  PATH_AUTOCONF=$(find /usr/share -maxdepth 1 -type d -name "automake-*" | sort | tail -n 1)
  rm config.guess config.sub
  ln -s $PATH_AUTOCONF/config.guess .
  ln -s $PATH_AUTOCONF/config.sub .
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --enable-appindicator 
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/${pkgname%-*}.schemas" \
    "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
