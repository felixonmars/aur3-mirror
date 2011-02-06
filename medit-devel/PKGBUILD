# Contributor: Frank Smit <frank/61924/nl>

pkgname=medit-devel
pkgver=0.99.91
pkgrel=1
pkgdesc="medit is a programming and around-programming text editor."
arch=('i686' 'x86_64')
url="http://medit.bitbucket.org"
options=('!emptydirs')
license=('GPL')
depends=('pygtk' 'libxml2' 'pcre' 'libsm' 'python2' 'gtk2' 'gcc-libs')
makedepends=('pkgconfig' 'perlxml' 'intltool' 'gcc-objc')
conflicts=('medit')
replaces=('medit')
provides=('medit')
install=medit.install
source=(http://downloads.sourceforge.net/mooedit/unstable/medit-${pkgver}-devel.tar.bz2 womwolf.xml)

md5sums=('a54c303f389adfaa50e18604bb3c2b09'
         'a6db15d79dacdda524f2d60301e39d4a')

build() {
  cd $srcdir/medit-${pkgver}-devel

  ./configure --prefix=/usr PYTHON=python2

  make
  make DESTDIR=${pkgdir} install

  cd ${pkgdir}/usr/share/medit-1/language-specs
  cp $srcdir/womwolf.xml ./
  sed -i "s|*.sh|*.sh;PKGBUILD|" sh.lang

  rm -rf $pkgdir/usr/share/mime && \
  rm -rf $pkgdir/usr/share/icons/hicolor/icon-theme.cache
}
