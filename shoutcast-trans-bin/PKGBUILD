# Maintainer: Emrah Nizam <emrahnzm@gmail.com>

pkgname=shoutcast-trans-bin
_pkgname=shoutcast-trans
pkgver=2
pkgrel=1
pkgdesc="Nullsoft SHOUTcast Streaming Client"
arch=('any')
url="http://www.shoutcast.com"
license=('custom')
depends=('gcc' 'detachtty')

if [ $CARCH = "i686" ];then
source=('http://download.nullsoft.com/shoutcast/tools/sc_trans_linux_10_07_2011.tar.gz'
	'shoutcast-trans.d'
	"$_pkgname.conf")
md5sums=('1eabe2716f5ab857a600dbd89d6192b6'
	 '9bfdc644c07cda3484418cead22bb8b1'
	 'c400d6d9b1946ebdb3a0d5683a8cef68')
else
source=('http://download.nullsoft.com/shoutcast/tools/sc_trans_linux_x64_10_07_2011.tar.gz'
        'shoutcast-trans.d'
        "$_pkgname.conf")
md5sums=('800489ee6e2dd23f75524e8dabc0f8b2'
         '9bfdc644c07cda3484418cead22bb8b1'
         'c400d6d9b1946ebdb3a0d5683a8cef68')

fi


build() {
  rm -rf $srcdir/playlists/win32
  cd $srcdir
  install -d "$pkgdir/var/log/$_pkgname"
  install -Dm 775 "sc_trans" "$pkgdir/usr/share/$_pkgname/bin/sc_trans"
  install -Dm 644 "$startdir/$_pkgname.conf" "$pkgdir/etc/$_pkgname.conf"
  install -Dm 775 "$startdir/shoutcast-trans.d" "$pkgdir/etc/rc.d/shoutcast-trans"
  install -d $pkgdir/usr/share/$_pkgname/example-confs
  install -Dm 644 {sc_trans_basic.conf,sc_trans_capture.conf,sc_trans_debug.conf,sc_trans_dj.conf,sc_trans_playlist.conf,sc_trans_simple.conf} "$pkgdir/usr/share/$_pkgname/example-confs/"
  cp -R {calendar,config_builder,docs,music,playlists,vuimages} "$pkgdir/usr/share/$_pkgname/"
}
