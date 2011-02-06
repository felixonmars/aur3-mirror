# Contributor: Mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=qtuneroid
pkgver=0.9
pkgrel=7
pkgdesc="Tuner for variety of musical instruments (especially guitar)"
url="http://sourceforge.net/projects/qtuneroid/"
depends=('kdelibs' 'alsa-lib' 'qt3')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/${pkgname}-${pkgver}.tar.gz
'qtuneroid.desktop')
md5sums=('1c23cbfc92c98892ad4a76e453c57279'
         'b77aca1c3e1e274a572b1113345dad65')
arch=('i686' 'x86_64')
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  QTDIR=/opt/qt ./configure --prefix=/usr --disable-debug 
  sed -i -e 's/\$(datadir)/$(DESTDIR)\/$(datadir)/' $startdir/src/${pkgname}-${pkgver}/src/pics/Makefile
  sed -i -e 's/\$(datadir)/$(DESTDIR)\/$(datadir)/' $startdir/src/${pkgname}-${pkgver}/src/i18n/Makefile
  make DESTDIR=$startdir/pkg || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p  $startdir/pkg/usr/share/applications/
  cp $startdir/qtuneroid.desktop $startdir/pkg/usr/share/applications/
}
