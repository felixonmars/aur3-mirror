# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: melchips <truphemus.francois + gmail + com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=gwhere
pkgver=0.2.3
pkgrel=5
pkgdesc="A catalog manager for CDs, portable HDDs, and other removable media"
arch=('i686' 'x86_64')
url="http://www.gwhere.org/"
license=('GPL')
depends=('gtk2')
options=('!libtool')
source=(http://www.$pkgname.org/download/source/$pkgname-$pkgver.tar.gz)
md5sums=('73b4ca918a61460758951318acd5eda8')

build() {
  [[ $CARCH == x86_64 ]] && export CFLAGS+=" -fPIC"

  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|gnome/apps/||; s|applnk/||; s/Applications/applications/' Makefile.in
  sed -i '/^Name/ s/=.*/=GWhere/' $pkgname.desktop

  # Fix for parsing error in the INTL Makefile
  sed -i 's/^@GT_YES@intlh\.inst: intlh\.inst\.in \.\.\/config.status$/& \\/g' \
    intl/Makefile.in

  # Fix for missing libgmodule-2.0 on linking
  sed -i 's/gwhere_LDADD = /&-lgmodule-2.0/g' src/Makefile.in

  ./configure --prefix=/usr --mandir=/usr/share/man --libdir=/usr/lib --enable-gtk20
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
