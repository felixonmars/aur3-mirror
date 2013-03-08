# Maintainer: J. W. Birdsong  <jwbirdsong AT gmail DOT com>
# Contributor: Lukasz Fidosz <virhilo@gmail.com>
pkgname=xrenderbenchmark
pkgver=0.10
pkgrel=3
pkgdesc="The xrender benchmark."
arch=('i686'  'x86_64')
license=('custom')
url="http://cgit.freedesktop.org/~aplattner/xrenderbenchmark/"
depends=('qt4' 'xorg-server')
options=(libtool)

source=("http://cgit.freedesktop.org/~aplattner/xrenderbenchmark/snapshot/xrenderbenchmark-master.tar.bz2" ${pkgname}.launcher)

md5sums=('ea2e30ead67ce221b64a1287105859ff'
         'f29c1ea62612fbca82554a3e0e0ffe92')

build() {
  cd $srcdir/$pkgname-master
  export LDFLAGS='-lm'
  libtoolize --force --copy 
 sed -i "s|libpng12|libpng|" configure.ac
 sed -i "s|png_set_gray_1_2_4_to_8|png_set_expand_gray_1_2_4_to_8|" readpng.c 
 sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
./autogen.sh
./configure --prefix=/usr 
make
}
package() {
cd $srcdir/$pkgname-master
install -dm755  ${pkgdir}/usr/share/${pkgname}/images/ ${pkgdir}/usr/bin
install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
install -D -m755 $srcdir/${pkgname}.launcher \
            ${pkgdir}/usr/bin/${pkgname}

mv images/*  ${pkgdir}/usr/share/${pkgname}/images/
mv xrenderbenchmark ${pkgdir}/usr/share/${pkgname}

}
# vim:set ts=8 sw=2 et:


