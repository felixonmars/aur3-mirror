# Contributer: Baumi <Baumi@gmx.com>
pkgname=irssi_silc_plugin
pkgver=1.0.5
_silcclientver=1.0.3
_plugver=1.0.5.1
_irssiver=0.8.10
pkgrel=1
pkgdesc="Silc Plugin for irssi, details at: http://penguin-breeder.org/silc/"
arch=(i686 x86_64)
license=('GPL')
depends=('glib2' 'openssl' 'ncurses' 'irssi>=0.8.10')
source=(http://irssi.org/files/irssi-$_irssiver.tar.bz2
	http://silcnet.org/download/client/sources/silc-client-$_silcclientver.tar.gz
	http://penguin-breeder.org/silc/download/silc-plugin-$_plugver.tar.gz)
url="http://penguin-breeder.org/silc/"	
md5sums=('4b83d4047670eb75bd14ae1bdd68dc38' '82c3ea6bf1dd64a27af39a05d35b3f16' '1f1a2a0ad57ea623820262a0ad7c4854')

build() {

  # SILC-Plugin
  cd $startdir/src/silc-client-$_silcclientver
  ./configure --prefix=/usr \
     --with-helpdir=$startdir/pkg/usr/share/irssi/help/silc \
     --without-libtoolfix \
     --enable-static \
     --enable-debug \
     --without-silc-libs || return 1
  make -C lib
  cd $startdir/src/silc-plugin-$_plugver
  make patch IRSSI=$startdir/src/irssi-$_irssiver SILC=$startdir/src/silc-client-$_silcclientver || return 1
  install -m 755 -D $startdir/src/silc-plugin-$_plugver/scripts/silc.pl $startdir/pkg/usr/share/irssi/scripts/silc.pl || return 1
  install -m 755 -D $startdir/src/silc-plugin-$_plugver/scripts/silc-mime.pl $startdir/pkg/usr/share/irssi/scripts/silc-mime.pl || return 1

  # IRSSI compile
  cd $startdir/src/irssi-$_irssiver
  ./configure --prefix=/usr --enable-ipv6 --with-proxy --sysconfdir=/etc || return 1

  make -C src/perl
  make -C src/fe-common/silc
  make -C src/silc/core

  make DESTDIR=$startdir/pkg -C src/perl/silc install || return 1
  make DESTDIR=$startdir/pkg -C src/fe-common/silc install || return 1
  make DESTDIR=$startdir/pkg -C src/silc/core install || return 1

  # Fix segfaults on connections (ugly hack)
  mv $startdir/pkg/usr/lib/irssi/modules/libfe_common_silc.so $startdir/pkg/usr/lib/irssi/modules/libfe_silc.so
  mv $startdir/pkg/usr/lib/irssi/modules/libfe_common_silc.a $startdir/pkg/usr/lib/irssi/modules/libfe_silc.a

  find $startdir/pkg -name '*.la' -exec rm {} \;
  rm $startdir/pkg/usr/lib/perl5/*/*/perllocal.pod
  mv $startdir/pkg/usr/lib/perl5/?.?.? $startdir/pkg/usr/lib/perl5/current

  # SILC-Client
  cd $startdir/src/silc-client-$_silcclientver
  make -C apps/irssi/docs/help install || return 1

}
