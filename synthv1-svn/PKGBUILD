# Contributor: Jiří Procházka <ojirio at gmail dot com>

pkgname=synthv1-svn
pkgver=780
pkgrel=1
pkgdesc="An old-school all-digital 4-oscillator subtractive polyphonic synthesizer with stereo fx"
arch=(i686 x86_64)
url="http://synthv1.sourceforge.net/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'jack' 'qt4')
conflicts=('synthv1')
provides=('synthv1')
install="$pkgname.install"
_svntrunk=(http://svn.code.sf.net/p/synthv1/code/trunk)

build() {
  if [ -d $srcdir/.svn ]
  then
      svn up $srcdir
  else
      svn co $_svntrunk $srcdir
  fi

  # x86_64 lib path fix
  sed -i "s/lib64/lib/" synthv1_lv2.pro

  aclocal && autoheader && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
