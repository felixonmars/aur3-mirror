# Contributor: Alex Suykov <axs@ukr.net>

# Note about the third patch: xjdic will now try to load
#     ~/.xjdicrc, if $HOME is set
#     $XJDIC/xjdicrc, if $XJDIC is set
#     /usr/share/xjdic/xjdicrc, if $XJDIC is not set
# in that order. I had to tweak it as the original logic,
# with system-wide config file taking precedence over
# user's, looked really strange.

pkgname=xjdic
pkgver=2.4
pkgrel=1
pkgdesc="Japanese-English dictionary program"
arch=('i686' 'x86_64')
url="http://www.csse.monash.edu.au/~jwb"
license=('GPL')
makedepends=(make gcc)
source=(ftp://ftp.monash.edu.au/pub/nihongo/xjdic24.tgz \
  xjdicrc
  xjdic24-stdlib.patch
  xjdic24-docdir.patch
  xjdic24-xjdrc.patch)
md5sums=('4155c4613b6bf540d6cb26f3a7ed276a'
         'e9a3249d7b884c20e8cb62856959daa1'
         'b06804bb4f11009034ee0491458977ad'
         '2dac45bae7dbef209a631b2c621ad211'
         'd375b631c1e2ce09af1d39087b230dcf')

build() {
  cd "$srcdir"
  patch -p1 -i ${source[2]}
  patch -p1 -i ${source[3]}
  patch -p1 -i ${source[4]}
  make || return 1

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/man/man1"
  mkdir -p "$pkgdir/usr/share/xjdic/doc"

  install -m 0755 exjdxgen xjdic_sa xjdic_cl xjdserver xjdxgen "$pkgdir/usr/bin"
  install -m 0644 xjdic.1 "$pkgdir/usr/man/man1"
  install -m 0644 xjdic*.{inf,install,WHATSNEW} "$pkgdir/usr/share/xjdic/doc"
  install -m 0644 kanjstroke radkfile radicals.tm romkana.cnv vconj "$pkgdir/usr/share/xjdic"
  install -m 0644 ${source[1]} "$pkgdir/usr/share/xjdic/xjdicrc"
}

# vim:set ts=2 sw=2 et:
