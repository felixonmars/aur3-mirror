# Contributor: Jiří Procházka <ojirio at gmail dot com>

pkgname=drumkv1-svn
pkgver=150
pkgrel=1
pkgdesc="An old-school all-digital drum-kit sampler synthesizer with stereo fx"
arch=(i686 x86_64)
url="http://drumkv1.sourceforge.net/"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'jack' 'qt4')
conflicts=('drumkv1')
provides=('drumkv1')
install="$pkgname.install"
_svntrunk=(http://svn.code.sf.net/p/drumkv1/code/trunk)

build() {
  if [ -d $srcdir/.svn ]
  then
      svn up $srcdir
  else
      svn co $_svntrunk $srcdir
  fi

  # x86_64 lib path fix
  sed -i "s/lib64/lib/" drumkv1_lv2.pro

  aclocal && autoheader && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
