# Contributor: Renato C. Aguiar <renato.rca@gmail.com>

pkgname=fortune-mod-chucknorris-pt_br
pkgver=20070415
pkgrel=1
arch=(i686 x86_64)
pkgdesc="The Chuck Norris fortune-mod in brazilian portuguese"
url="http://www.chucknorris.com.br/"
depends=(fortune-mod)
source=(chucknorris-pt_br)
md5sums=('25dd28c33f7895dad325feb7de8edee1')

build() {
  mkdir -p $startdir/pkg/usr/share/fortune/pt_br
  cp -f $startdir/src/chucknorris-pt_br $startdir/pkg/usr/share/fortune/pt_br/chucknorris
  cd $startdir/pkg/usr/share/fortune/pt_br
  strfile chucknorris
}
