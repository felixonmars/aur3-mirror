# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=dyn4000
_pluginname2=dyn1-4000
_pluginname3=dyn2-4000
_pluginrealname=DYN4000
pkgname=linuxdsp-$_pluginname
pkgver=1.0.3b
pkgrel=1
pkgdesc="linuxdsp dyn4000 console dynamics (lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('4ac9fa758b071053c5b25d399bbf06e52d4b7ead1973e6789c52d4a0733a97e20ace7342f141be3becec748019f9242d13da147f59860c052e254f9cc891f936')

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
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname2.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done
 # stereo
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname3.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname3.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname3.lv2/$i"
 done

 # VST
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/VST"
 # mono
 install -Dm755 "$_pluginrealname-1.so" "$pkgdir/usr/lib/lxvst/$_pluginrealname-1.so"
 # stereo
 install -Dm755 "$_pluginrealname-2.so" "$pkgdir/usr/lib/lxvst/$_pluginrealname-2.so"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
