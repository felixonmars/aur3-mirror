# Maintainer: Emrah Nizam <emrahnzm@gmail.com>

pkgname=shoutcast2-bin
_pkgname=shoutcast2
pkgver=2
pkgrel=3
pkgdesc="Nullsoft SHOUTcast Server"
arch=('any')
url="http://www.shoutcast.com"
license=('custom')
depends=('gcc' 'detachtty')

if [ $CARCH = "i686" ];then
source=('http://download.nullsoft.com/shoutcast/tools/sc_serv2_linux_07_31_2011.tar.gz'
	'shoutcast.d'
	"$_pkgname.conf")
md5sums=('5467616b2f96940998694f65566796d5'
	 'b0d94fe953f06aca909a04f57e7c5277'
	 'd96e2bbe171cb62990b4778cb94d04c0')
else
source=('http://download.nullsoft.com/shoutcast/tools/sc_serv2_linux_x64_07_31_2011.tar.gz'
        'shoutcast.d'
        "$_pkgname.conf")
md5sums=('b355e7570f33e380e6cf729eabeb92c5'
         'b0d94fe953f06aca909a04f57e7c5277'
         'd96e2bbe171cb62990b4778cb94d04c0')
fi


build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/$_pkgname/{bin,docs,example-confs,config_builder}
  install -d "$pkgdir/var/log/$_pkgname"
  install -Dm 775 "sc_serv" "$pkgdir/usr/share/$_pkgname/bin"
  install -Dm 644 "$startdir/$_pkgname.conf" "$pkgdir/etc/$_pkgname.conf"
  install -Dm 775 "$startdir/shoutcast.d" "$pkgdir/etc/rc.d/shoutcast"
  install -m 644 {sc_serv_basic.conf,sc_serv_debug.conf,sc_serv_public.conf,sc_serv_relay.conf,sc_serv_simple.conf} "$pkgdir/usr/share/$_pkgname/example-confs/"
  cp -R {docs,config_builder} "$pkgdir/usr/share/$_pkgname/"
}
