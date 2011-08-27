#Contributor: Sven Kauber <celeon@gmail.com>

pkgname=skype_dsp_hijacker
pkgver=0.8
pkgrel=2
pkgdesc="A workaround for Skype bug that prevents making calls"
url="http://juljas.net/linux/skype/"
depends=('skype-beta' 'glibc' 'bash')
source=(http://juljas.net/linux/skype/$pkgname-$pkgver.tar.gz)
md5sums=('f2cf2891ef9934728f6e09df764af3fb')

build(){
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's|^.*PREFIX=/usr/local.*$|PREFIX=/usr|' Makefile
  sed -i 's|^.*prefix=/usr/local.*$|prefix=/usr|' skype_dsp_hijacker
  sed -i "s|^.*CFLAGS=.*$|CFLAGS=-O2 -Wall -m32\nCFLAGS=-DHAVE_ALSA|" Makefile
  make || return 1
  install -Dm755 skype_dsp_hijacker $startdir/pkg/usr/bin/skype_dsp_hijacker
  install -Dm644 libskype_dsp_hijacker.so $startdir/pkg/usr/lib/libskype_dsp_hijacker.so
}
