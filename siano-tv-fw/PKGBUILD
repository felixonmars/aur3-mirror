# Contributor: Daniel YC Lin <dlin.tw at gmail>
pkgname=siano-tv-fw
pkgver=0.1
pkgrel=1
pkgdesc="Firmware for Siano Mobile Silicon Nice(187f:0202) funuv digital TV usb 2.0"
arch=(any)
url="http://70tw.spotlight.net.tw/?tag=tv"
license=('unknown')
source=(http://steventoth.net/linux/sms1xxx/sms1xxx-hcw-55xxx-dvbt-02.fw
        http://dl.dropbox.com/u/37232373/tw_DVB-T.xspf)
noextract=(sms1xxx-hcw-55xxx-dvbt-02.fw)
install=$pkgname.install

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/lib/firmware $pkgdir/usr/share/siano-tv-fw
  cp tw_DVB-T.xspf $pkgdir/usr/share/siano-tv-fw
  cp sms1xxx-hcw-55xxx-dvbt-02.fw $pkgdir/lib/firmware
  cd $pkgdir/lib/firmware
  ln -s sms1xxx-hcw-55xxx-dvbt-02.fw dvb_nova_12mhz_b0.inp
}
sha1sums=('c24b9082784b32e72ef22c522d2df7d151fed642'
          '2e7298b5bab24374be3b50994b5835a19f1fb251')
