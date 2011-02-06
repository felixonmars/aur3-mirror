# Contributor: Sergej Pupykin <ps@lx-ltd.ru>
pkgname=xlib-locale-ru-ru-utf8
pkgver=0.2
pkgrel=1
pkgdesc="ru_RU.UTF-8 Xlib locale files"
url="http://wiki.fantoo.ru/index.php/HOWTO_GTK1_with_UTF8"
license=("GPL")
arch=(any)
depends=('libx11')
conflicts=()
replaces=()
backup=()
install=xlib-locale-ru-ru-utf8.install
source=(Compose.bz2 \
	XI18N_OBJS.bz2 \
	XLC_LOCALE.bz2)
md5sums=('fcfb961c8cc8767b2ee4c9271f9542ef' '4fcc45b2046468f9fde1d7ab4edd863c'\
         '39905296dcf33ecf3e2ef74cff61122f')

build() {
  #
  ####
  local _XLOCALEDIR=/usr/share/X11/locale/
  ####
  #
  cd $startdir/src/
  install -d -m 0755 $startdir/pkg/$_XLOCALEDIR/ru_RU.UTF-8 && \
  install -m 0644 $startdir/src/Compose $startdir/pkg/$_XLOCALEDIR/ru_RU.UTF-8 && \
  install -m 0644 $startdir/src/XI18N_OBJS $startdir/pkg/$_XLOCALEDIR/ru_RU.UTF-8 && \
  install -m 0644 $startdir/src/XLC_LOCALE $startdir/pkg/$_XLOCALEDIR/ru_RU.UTF-8
}
