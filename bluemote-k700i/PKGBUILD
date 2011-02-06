pkgname=bluemote-k700i
arch=('i686')
pkgver=2.0
pkgrel=1
pkgdesc="Will turn your Bluetooth-enabled mobile phone into a remote control for your computer - only for SE k700i"
url="http://www.geocities.com/saravkrish/progs/bluemote"
license="GPL"
conflicts=('bluemote')
provides=('bluemote')
depends=('libxtst')
source=(http://www.geocities.com/saravkrish/progs/bluemote/bluemote.$pkgver.tar.gz \
http://www.geocities.com/saravkrish/progs/bluemote/scripts.tar.gz \
bluemote.rules bluemote.c serial.c bluemote.install)
install=bluemote.install
md5sums=('69ab4eafb839a3f22fca2832fbba60f6' \
'd1d21cab765522ff9ce82b60a23bd150' 'c246b00d5a226bc00d1b85036dafcaca' \
'867509118e1073ae8232c4b45e55bd40' '7879d092a14301d4c4f0f8d22d3ac732' \
'aef4799a5405626573e073a75ae8e5aa')

build () {
  cd $startdir/src/
  cp bluemote.c $startdir/src/bluemote/
  cp serial.c $startdir/src/bluemote/
  cd $startdir/src/bluemote
  make clean
  make || return 1
  install -d $startdir/pkg/usr/bin $startdir/pkg/etc/bluemote
  install -m755 bluemote $startdir/pkg/usr/bin
  install -m644 bluemote-example.cfg $startdir/pkg/etc/bluemote/bluemote.cfg
  install -m644 config.txt $startdir/pkg/etc/bluemote/config.txt 
  cd $startdir/src/
  chmod 755 scripts/ -R
  cp -R scripts/ $startdir/pkg/etc/bluemote/
  cd $startdir/src/
  install -D -m644 bluemote.rules $startdir/pkg/etc/udev/rules.d/bluemote.rules
}