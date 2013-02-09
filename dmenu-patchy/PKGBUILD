# Maintainer: Colin Shea <colin@shea.at>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Bharani Deepan <bharanideepan at_ gmail>

pkgname=dmenu-patchy
pkgver=4.5
pkgrel=1
pkgdesc="Dynamic X menu, patched with XFT, quiet, x & y, token, follow focus, tab nav, filter"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxinerama' 'libxft')
conflicts=('dmenu')
provides=('dmenu')
source=(http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz
        xft.diff
        height.diff
        token.diff
        xrdb.diff
        qxyw.diff
        0001-fix-pasting-from-the-X-clipboard.patch
        tabnav.diff
        filter.diff)

md5sums=('9c46169ed703732ec52ed946c27d84b4'
         '0c73d595eb78f159bea83f33bba15e80'
         'dd511592290157ce9d31d37ecffb4d16'
         'd62fbee3c08af77a85ad63076a59c7e1'
         '424a9b8dadfb0850f5608ed826b09754'
         'ec3f68700118b006f89683420455139f'
         'da7caae587c4af5aff8fd508507522c3'
         'e501f73d154b0fa3eedd82c30a5530a0'
         '19cc7b4d3ad885e65f178f3bdce8fd3b')

sha256sums=('082cd698d82125ca0b3989006fb84ac4675c2a5585bf5bb8af0ea09cfb95a850'
            'da72bb93d2aa06139bbb53826c50285e754543c19e7945a7f30de4d3b43425b1'
            'b32e0711e6d51cc35ae5bd88299bb4b9fc5e13dc4efd4453e657ced267fe7876'
            'dbe233edc9d0608323522c2100c9f427619c71152089cea579c466fc582bc19c'
            'f50a6f7a621a827b8a16a0207912b89b307bbaffa2b205dce8d218291712e60c'
            'c7c94e41529002f314e100c6178a6982789432aa8be125f0a8e6ff6c868ac339'
            'd36bd60c6bfd7022a09bc2b249ea5fa4cb599147f35f3073100a31d8149cddd6'
            'cd238c040e4fc9f4fe037bad71bdf628117f1a1b41a482f0d5a6097b9b021c80'
            '8e6fd465ba29c87ceebdbb44e91518471067ea39bb1ee4685b5c2e7c5004320f')

build() {
  cd "$srcdir/dmenu-$pkgver"
  patch -p1 -N -i $srcdir/xft.diff
  patch -p1 -N -i $srcdir/height.diff
  patch -p1 -N -i $srcdir/qxyw.diff
  patch -p1 -N -i $srcdir/token.diff
  patch -p1 -N -i $srcdir/xrdb.diff
  patch -p1 -N -i $srcdir/0001-fix-pasting-from-the-X-clipboard.patch
  patch -p1 -N -i $srcdir/tabnav.diff
  patch -p1 -N -i $srcdir/filter.diff
  make
}

package()
{
  cd "$srcdir/dmenu-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

