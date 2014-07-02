# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=peq
_pluginrealname=PEQ-1A
_pluginrealname2=PEQ-2A
pkgname=linuxdsp-$_pluginname-2a
pkgver=1.0.6
pkgrel=1
pkgdesc="linuxdsp vintage pultec program eq (jack, lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('40df503c69898bbb4db45e7e96e598ea9bac93e6e0f08926d466d026391360fb27e410761c1e367b7f579b67b67dd452b397f02e4407996826f149fdb88474b7')

if [ "$CARCH" = 'i686' ]; then
 _arch=x86
elif [ "$CARCH" = 'x86_64' ]; then
 _arch=x86-64
fi

prepare() {
 cd "$srcdir/$_pluginrealname2/$_arch/"
 tar xf plugin_binaries.tar.gz
}

package() {
 # LV2
 # mono
 cd "$srcdir/$_pluginrealname2/$_arch/plugin_binaries/LV2/$_pluginname-1a.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname-1a.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname-1a.lv2/$i"
 done
 # stereo
 cd "$srcdir/$_pluginrealname2/$_arch/plugin_binaries/LV2/$_pluginname-2a.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname-2a.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname-2a.lv2/$i"
 done

 # VST
 cd "$srcdir/$_pluginrealname2/$_arch/plugin_binaries/VST"
 # mono
 install -Dm755 "$_pluginrealname.so" "$pkgdir/usr/lib/lxvst/$_pluginrealname.so"
 # stereo
 install -Dm755 "$_pluginrealname2.so" "$pkgdir/usr/lib/lxvst/$_pluginrealname2.so"

 # JACK
 cd "$srcdir/$_pluginrealname2/$_arch/plugin_binaries/JACK"
 install -Dm755 "$_pluginname-2a-$_arch" "$pkgdir/usr/bin/$pkgname-2a"


 cd "$srcdir/$_pluginrealname2"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
