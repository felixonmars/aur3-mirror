# Contributor: Mantas Zimnickas <sirexas@gmail.com>
pkgname=texlive-littex
pkgver=20081028
pkgrel=1
pkgdesc="Lithuanian language support package for TeX"
arch=(i686 x86_64)
url="http://www.vtex.lt/tex/"
license=('GPL')
groups=('texlive-lang')
depends=('texlive-core')
install=texlive.install
source=("http://www.vtex.lt/tex/distfiles/littex-$pkgver.tar.gz")
md5sums=('5945b43689ff51d2adb32e1125110756')  #generate with 'makepkg -g'

build() {
  cd $srcdir
  install -m755 -d $pkgdir/usr/share || return 1
  find texmf* -type d -exec install -d -m755 $pkgdir/usr/share/'{}' \; || exit 1
  find texmf* -type f -exec install -m644 '{}' $pkgdir/usr/share/'{}' \; || exit 1
}

# vim:set ts=2 sw=2 et:
