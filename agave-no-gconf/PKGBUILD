# Maintainer: Syr <vorstar at mac dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=agave-no-gconf
_pkgname=agave
pkgver=0.4.7
pkgrel=4
pkgdesc="Colorscheme designer tool for GNOME (no GConf)"
arch=('i686' 'x86_64')
url="http://home.gna.org/colorscheme/"
license=('GPL')
depends=('libglademm' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('gnome-doc-utils' 'intltool' 'boost' 'cppunit')
install=$pkgname.install
conflicts=('agave')
provides=('agave')
source=("http://download.gna.org/colorscheme/releases/$_pkgname-$pkgver.tar.bz2"
        agave-0.4.7-mdv-fix-str-fmt.patch
        schemebox.patch
        drop-libgnome.patch
        gconf.patch)
md5sums=('93097881f28dcae1eca2800a763f77c3'
         'd96ddfe751d8fd4d13a443b94fafb0b6'
         'c41adfd52ecbf837f4338e67693640fc'
         'bd951580f942f24344c882923e583f89'
         'c7d11e03615e5e5bb3adc471147f4870')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/agave-0.4.7-mdv-fix-str-fmt.patch" # Fedora patch
  patch -Np1 -i "$srcdir/schemebox.patch" # gcs-schemebox patch
  patch -Np1 -i "$srcdir/drop-libgnome.patch"
  patch -Np1 -i "$srcdir/gconf.patch" # no-gconf patch

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-scrollkeeper --disable-gnome --disable-schemas-install \
              --disable-gconf
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  make check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
