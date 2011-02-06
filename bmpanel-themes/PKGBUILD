pkgname=bmpanel-themes
pkgver=2.0.0
pkgrel=1
pkgdesc="Bmpanel themes collection"
arch=('i686' 'x86_64')
license=("unknown")
url=http://nsf.110mb.com/bmpanel/#themes
depends=(bmpanel)
source=('http://nsf.110mb.com/bmpanel/arch.tar.gz'
		'http://nsf.110mb.com/bmpanel/darkpink18.tar.gz'
		'http://nsf.110mb.com/bmpanel/Blacky.tar.gz'
		'http://nsf.110mb.com/bmpanel/clearlooks.tar.gz'
		'http://nsf.110mb.com/bmpanel/transpy.tar.gz'
		'http://nsf.110mb.com/bmpanel/darkblack18.tar.gz'
		'http://nsf.110mb.com/bmpanel/simplegray.tar.gz'
		'http://nsf.110mb.com/bmpanel/tint.tar.gz'
		'http://nsf.110mb.com/bmpanel/tint-pack.tar.gz'
		'http://nsf.110mb.com/bmpanel/clearlooks_iv.tar.gz'
		'http://nsf.110mb.com/bmpanel/glasswater.tar.gz'
		'http://nsf.110mb.com/bmpanel/carbon.tar.gz')

md5sums=('f30e56ac1a7cbcf34463d7e38118910b'
         'e42d170b3ec031f5c835831b54b8fb20'
         'ddd0407dbb9816b9c9c704f6781d3d52'
         '7ef4a367a57e1dd204fbc8b25d4a1c1b'
         'ff60273c7a4d24fc528f877169c7d45d'
         '6883bf6df9461610b6a1d8dd12f3c520'
         '83ec72febac43c0fb4e572d849ec0d42'
         'aca7fa18f5ec56b3d050a96b387cacba'
         '3d42be4de04604534fb994463c51c269'
         'a64f9ba1266206c5cd9d12a34030da71'
         '20f8666aa8c71cd404145ebf1fa03d45'
         'caa56a67c2c961d1504dc514c863a600')

build() {
  cd $startdir/src/
  rm *.tar.gz
  mv tint-pack/* $startdir/src
  rm -r tint-pack
  mkdir -p $startdir/pkg/usr/share/bmpanel/themes
  cp -r $startdir/src/* $startdir/pkg/usr/share/bmpanel/themes/
  find $startdir/pkg -type d -exec chmod 755 {} \;
  find $startdir/pkg -type f -exec chmod 644 {} \;
}

