pkgname=acroread-font-chinese-simplified
pkgver=9.1
pkgrel=1
pkgdesc="Simplified Chinese Font for Adobe Reader"
arch=('i686')
url="http://www.adobe.com/products/reader/"
license=('custom')
depends=('acroread>=9.1')
options=('!strip')
source=(http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.1/misc/FontPack910_chs_i486-linux.tar.bz2)
md5sums=('8abe3f7fb77918a8376b6793b841eaab')

build() {
  umask 022
  find $startdir/src -name LANG\*.TAR -exec tar -xf {} \;
  rm -f Adobe/Reader9/Resource/CMap/Identity-[HV]
  mkdir -p $startdir/pkg/usr/lib/acroread
  mv Adobe/Reader9/Resource $startdir/pkg/usr/lib/acroread
}
