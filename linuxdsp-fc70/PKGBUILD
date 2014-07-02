# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=fc70
_pluginrealname=FC70
pkgname=linuxdsp-$_pluginname
pkgver=1.0.4
pkgrel=1
pkgdesc="linuxdsp fc70 fairchild 670 limiter (jack, lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('6901c315c804ac68a030759315900e456be5172de98c47824304e0e393a1efef9c821a7fb4a86e395fcd16b8690799884de597eff53a17cce971f6343baca420')

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
 # LV2
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done

 # VST
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/VST"
 install -Dm755 "$_pluginrealname.so" "$pkgdir/usr/lib/lxvst/$_pluginrealname.so"

 # JACK
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/JACK"
 install -Dm755 "$_pluginname-$_arch" "$pkgdir/usr/bin/$pkgname"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
