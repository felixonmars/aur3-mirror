# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(teliasopia)
_plugins=('DynamicMultiband-0.0.2' 'MultibandFilter-0.0.1' 'compressor_sc4_GUI-0.0.1')
pkgver=0.0.2
pkgrel=1
pkgdesc="Teliasopia LV2 Plugins"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/teliasopia/"
license=('GPL')
depends=('lv2core' 'cairo' 'gtkmm')
source=("http://switch.dl.sourceforge.net/sourceforge/$pkgname/${_plugins[0]}.tar.gz"
        "http://switch.dl.sourceforge.net/sourceforge/$pkgname/${_plugins[1]}.tar.gz"
        "http://switch.dl.sourceforge.net/sourceforge/$pkgname/${_plugins[2]}.tar.gz")

md5sums=('dd34d60c17bd5fcdf0f8bd842f103ab0'
         'd0f486e078a0ec981b41ba7f8870bc2c'
         '202346c4af32bdf399a821334a5dc023')

build() {
  cd $srcdir/${_plugins[0]}/plugin

  sed -e "s:dynamicmultiband:filtro5bandas:g" \
      -e "s:-linv_util::" \
      Makefile > $srcdir/${_plugins[1]}/plugin/Makefile || return 1

  sed -e "s:dynamicmultiband:plugin:g" \
      Makefile > $srcdir/${_plugins[2]}/plugin/Makefile || return 1

  find $srcdir -name Makefile -exec sed 's_local/__' -i {} \; || return 1

  for _plugname in ${_plugins[*]}; do

    cd $srcdir/$_plugname || return 1

    make || return 1
    make DESTDIR=$pkgdir install-sys || return 1

  done
}

