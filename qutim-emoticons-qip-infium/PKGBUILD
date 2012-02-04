# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>

pkgname=qutim-emoticons-qip-infium
pkgver=0
pkgrel=2
pkgdesc="QIP Infium smileys for qutim-core"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('wget' 'tar' 'bzip2')
depends=('qutim')

_mod="qip_infium_smile_pack"
_modext="$_mod.tar.bz2"
_modsource="ftp://svtdpi_guest:wPeBC4J@www.svtdpi.com.ua/artwork/smileys/$_modext"

build() {

 cd $startdir/src

 msg "Getting sources from ..."
 wget -O $_modext $_modsource || return 1 

 msg "Cleaning..."
 rm -rf $_mod || return 1

 msg "Unpacking..."
 tar jxvf $_modext || return 1
 
 install -Dd \
  $startdir/src/$_mod \
  $pkgdir/usr/share/qutim/emoticons/$_mod || return 1

 install -D \
  $startdir/src/$_mod/* \
  $pkgdir/usr/share/qutim/emoticons/$_mod || return 1

}
