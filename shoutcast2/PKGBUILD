# Contributer: giacomogiorgianni@gmail.com

pkgname=shoutcast2
pkgver=0
pkgrel=0
pkgdesc="Nullsoft SHOUTcast Server"
arch=('x86_64' '686')
url="http://www.shoutcast.com"
license=('custom')
depends=('gcc' 'detachtty')
options=()
#md5sums=(72f9f5ec8d680bff60ba47dd21b0fe4a)
#source=(http://yp.shoutcast.com/downloads/sc1-9-8/sc_serv_1.9.8_Linux.tar.gz)

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='linux_x64'
    md5sums=('b355e7570f33e380e6cf729eabeb92c5')
  elif [ "${CARCH}" = 'i686' ]; then
    ARCH='linux'
    md5sums=('5467616b2f96940998694f65566796d5')
  fi

source=http://download.nullsoft.com/shoutcast/tools/sc_serv2_${ARCH}_07_31_2011.tar.gz

build() {
  cd $startdir/src
  install -d $startdir/pkg/usr/bin
  install -m 755 sc_serv $startdir/pkg/usr/bin/shoutcast
  install -d $startdir/pkg/etc
  install -m 644 sc_serv_simple.conf $startdir/pkg/etc/sc_serv.conf
  mkdir -p $startdir/pkg/usr/doc

    cp     'sc_serv_basic.conf' $startdir/pkg/etc/
    cp     'sc_serv_debug.conf' $startdir/pkg/etc/
    cp     'sc_serv_public.conf' $startdir/pkg/etc/
    cp     'sc_serv_relay.conf' $startdir/pkg/etc/
    cp     'sc_serv_simple.conf' $startdir/pkg/etc/

    cp     -bR   'docs' $startdir/pkg/usr/doc/shoutcast
    cp     -bR   'config_builder' $startdir/pkg/usr/bin/
}
