# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=dsr500
_pluginrealname=DSR500
pkgname=linuxdsp-$_pluginname
pkgver=1.0.0
pkgrel=1
pkgdesc="linuxdsp dsr500 de-esser (lv2)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('4de572ae046740024309eef506c8976017709272accca84c3c6bca3e238a7e5f78249d9b6df8c14abe177cbc631d62266a3f41541ce80a3221bbd0e5141cd14e')

if [ "$CARCH" = 'i686' ]; then
 _arch=x86
elif [ "$CARCH" = 'x86_64' ]; then
 _arch=x86-64
fi

prepare() {
 cd "$srcdir/$_pluginrealname/$_arch/"
 tar xf plugin_binaries.tar.gz
}

package() {
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/dsr1-500.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/dsr1-500.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/dsr1-500.lv2/$i"
 done


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
