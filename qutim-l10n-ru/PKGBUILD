# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim-l10n-ru
pkgver=0
pkgrel=3
pkgdesc="Russian localization for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=('wget' 'tar' 'bzip2')

_mod=qutim-l10n-ru
_modext=$_mod.tar.bz2
_modsource=ftp://svtdpi_guest:wPeBC4J@www.svtdpi.com.ua/translations/qutim-l10n-ru.tar.bz2
#_modsource=ftp://svtdpi_guest:wPeBC4J@www.svtdpi.com.ua/translations/qutim-i18n-ru.tar.bz2

build() {

 cd $startdir/src

 msg "Getting sources from ..."
 wget -O $_modext $_modsource || return 1 

 msg "Cleaning..."
 rm -rf ru || return 1

 msg "Unpacking..."
 tar xjvf $_modext || return 1
 
 install -D \
  $startdir/src/ru/Russian/main.qm \
  $pkgdir/usr/share/qutim/languages/Russian/main.qm || return 1

 rm -rf $startdir/src/$_mod-build

}
