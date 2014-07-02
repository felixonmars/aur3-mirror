# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=sr2b
_pluginrealname=SR2B
pkgname=linuxdsp-$_pluginname
pkgver=1.0.5
pkgrel=1
pkgdesc="linuxdsp sr2b algorithmic stereo reverb (jack, lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('f25740b9f8406129213ed359815e0ecb0901b6e5775c3590ae8047146bf0b7ac12914d346a6147e1c336258bd6dea3d93b4d8ea9ebfa8c38801af4804a7a2eee')

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
 install -Dm755 "$_pluginname.so" "$pkgdir/usr/lib/lxvst/$_pluginname.so"

 # JACK
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/JACK"
 install -Dm755 "$_pluginname-$_arch" "$pkgdir/usr/bin/$pkgname"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
