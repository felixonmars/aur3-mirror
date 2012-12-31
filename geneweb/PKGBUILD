# Maintainer: Samuel Tardieu <sam@rfc1149.net>
pkgname=geneweb
pkgver=6.06
pkgrel=2
pkgdesc="Genealogy Software"
arch=('i686' 'x86_64')
url="http://www.geneweb.org/"
license=('GPL')
groups=()
depends=('lablgtk2')
makedepends=('ocaml' 'camlp5')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!makeflags)
install=geneweb.install
changelog=
source=(http://opensource.geneanet.org/attachments/download/211/gw-6.06-src.tgz gwd.conf gwd.service geneweb.install)
noextract=()
md5sums=('803627a3eeaa67bc147a7511bf257fc0'
         '8219a070e2bbf6aaeeb9c0f42825720d'
         'a89d188febe37b82ab7d936a7cafccc2'
         '42c8da80f6b1e24f0cd3243840574d58')

build() {
  cd "$srcdir"/gw-${pkgver}-src

  ./configure
  make PREFIX=/usr
}

package() {
  cd "$srcdir"/gw-${pkgver}-src

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" \
    DOCDIR="$pkgdir/usr/share/doc/geneweb" install

  install -D -m 644 "$srcdir/gwd.service" "$pkgdir/usr/lib/systemd/system/gwd.service"
  install -D -m 644 "$srcdir/gwd.conf" "$pkgdir/etc/conf.d/gwd"
}

# vim:set ts=2 sw=2 et:
