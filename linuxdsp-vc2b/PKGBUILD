# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=vc1b
_pluginname2=vc2b
_pluginrealname=VC2B
pkgname=linuxdsp-$_pluginname2
pkgver=1.0.3
pkgrel=1
pkgdesc="linuxdsp vc2b vintage compressor (jack, lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname2/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname2/$pkgname.tar.gz")
sha512sums=('8d3321f356eecdf229ed5285e74e4f41402935767e169fe9c914b5b5a913ac60dc80e4b0b249325d0021076c235a29c3b9d462ca3e26ed333e2268766a66ad15')

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
 # mono
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done
 # stereo
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname2.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done

 # VST
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/VST"
 # mono
 install -Dm755 "$_pluginname.so" "$pkgdir/usr/lib/lxvst/$_pluginname.so"
 # stereo
 install -Dm755 "$_pluginname2.so" "$pkgdir/usr/lib/lxvst/$_pluginname2.so"

 # JACK
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/JACK"
 install -Dm755 "$_pluginname2-$_arch" "$pkgdir/usr/bin/$pkgname"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
