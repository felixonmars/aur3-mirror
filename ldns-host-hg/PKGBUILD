pkgname=ldns-host-hg
_pkgname=${pkgname%-hg}
pkgver=r20.9aa60f18bd96
pkgrel=1
pkgdesc='DNS lookup utility based on ldns library'
url='http://tx97.net/ldns-host'
arch=('i686' 'x86_64')
license=('unknown')
options=('zipman')
depends=('ldns')
makedepends=('mercurial')
conflicts=('ldns-host')
provides=('ldns-host')
source=('hg+http://hg.tx97.net/ldns-host'
        'ldns-host-hg-linux.patch')
md5sums=('SKIP'
         '8ba8b7f0c0a8f83d342bf2188cc397d4')

prepare() {
  cd "$_pkgname"
  msg "srcdir: $srcdir"
  patch -i ../ldns-host-hg-linux.patch
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$_pkgname"
  make LOCALBASE=/usr
}

package() {
  cd "$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"

  make PREFIX="\"${pkgdir}/usr\"" MANDIR="\"${pkgdir}/usr/share/man\"" install
}

# vim:set ts=2 sw=2 et:
