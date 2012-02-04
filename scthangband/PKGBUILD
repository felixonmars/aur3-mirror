# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=scthangband
pkgver=1.0.18
pkgrel=2
pkgdesc="sCthAngband is an improved CthAngband which is set in H.P. Lovecrafts' Dreamlands."
arch=('i686' 'x86_64')
url="http://www.dimetrodon.demon.co.uk/scthangband.html"
license=('custom')
depends=('ncurses' 'libx11')
source=(http://www.dimetrodon.demon.co.uk/scthangband1018.zip)
md5sums=('81df2f2c6a9d9f753573f5454b396bb4')
 
build() {
  cd $srcdir/scthangband1018/src
  mv config.h config.h.org
  sed -e 's/\#\ define\ DEFAULT_PATH\ \"\.\/lib\/\"/\#\ define\ DEFAULT_PATH\ \"\/usr\/lib\/scthangband\/\"/' config.h.org > config.h
  sed -e '102,153d' makefile.org > Makefile.tmp
  sed -e '102a\CFLAGS = -Wall -O2 -fno-strength-reduce -pipe -g -D"USE_GCU" -D"USE_X11"\
LIBS = -lX11 -lncurses' Makefile.tmp > Makefile
  make || return 1
  install -d "$startdir/pkg/usr/bin/" || return 1
  install -d "$startdir/pkg/usr/lib/$pkgname" || return 1
  cp -p Cthangband "$startdir/pkg/usr/bin/" || return 1
  cp -rp ../lib/* "$startdir/pkg/usr/lib/$pkgname/" || return 1
  chown -R root:games "$startdir/pkg/usr/lib/$pkgname/"
  chmod 775 "$startdir/pkg/usr/lib/$pkgname/apex"
  chmod 775 "$startdir/pkg/usr/lib/$pkgname/save"
  chmod 775 "$startdir/pkg/usr/lib/$pkgname/data"
  find $startdir/pkg/usr/lib/$pkgname/ -name delete.me -exec rm {} \;
  find $startdir/pkg/usr/lib/$pkgname/ -name 'Makefile*' -exec rm {} \;
  cd $pkgdir/usr/bin && ln -s Cthangband $pkgname
}
