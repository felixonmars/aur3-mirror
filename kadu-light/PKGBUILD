# Contributor: Lukasz Klepacki <ayrie3@gmail.com>

pkgname=kadu-light
pkgver=0.5.0
pkgrel=2
pkgdesc="A light-weight version of a Gadu-Gadu IM written in QT. This version includes only basic modules."
url="http://www.kadu.net/"
license=(GPL)
depends=(openssl curl alsa-lib)
conflicts=('kadu-svn' kadu)
install=$pkgname.install
source=(http://www.kadu.net/download/stable/kadu-$pkgver.tar.bz2)
md5sums=('895f7c88d36dbb188e8bc26664fbf430')

_static="icons_default emoticons_gg6_compatible"
_disable="emoticons_penguins icons_crystal16 icons_crystal22 icons_nuvola16 icons_nuvola22 icons_glass16 icons_glass22 module_autoresponder module_ext_sound module_ext_info module_ao_sound module_screenshot module_osdhints_notify module_led_notify module_tabs  module_weather module_xosd_notify module_pcspeaker module_spellchecker module_advanced_userlist module_filtering module_firewall module_exec_notify module_xmms module_iwait4u module_mail module_powerkadu module_miastoplusa_sms module_esd_sound module_amarok module_arts_sound module_dcopexport module_nas_sound module_macosx_docking"

build() {
  cd $startdir/src/kadu

  sed -r -i 's/(^[0-9a-z_]+=)[yn]$/\1m/' .config

  for m in $_disable; do
    sed -i "s/^$m=m/$m=n/" .config || return 1
  done
  for m in $_static; do
    sed -i "s/^$m=m/$m=y/" .config || return 1
  done


  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -rf $startdir/pkg/usr/{lib,include}/{libgadu*,pkgconfig}
  rm -rf $startdir/pkg/usr/share/kadu/{HISTORY,README}
}
