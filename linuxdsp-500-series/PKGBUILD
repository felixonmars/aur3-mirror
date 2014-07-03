# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=500-series
_pkgname2=500
_pkgname3=500series
_vendor=linuxDSP
pkgname=linuxdsp-$_pkgname
pkgver=1
pkgrel=1
pkgdesc="linuxdsp 500-series (lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pkgname2/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
conflicts=('linuxdsp-workstation-plugins-pack')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pkgname2/linuxdsp-$_pkgname3.tar.gz")
sha512sums=('e99b747f36cf202cda18feeb71b9b14aa4639bdab2fd5e549f923008384c7693998c399727ed37ac4b71852e549eb73fe902736cfaa6cedf5332cb5d22a5acd6')

if [ "$CARCH" = 'i686' ]; then
 _arch=x86
elif [ "$CARCH" = 'x86_64' ]; then
 _arch=x86-64
fi

_prepare() {
 cd "$srcdir/500SERIES/$_plugin/$_arch/"
 tar xf plugin_binaries.tar.gz
}

_package() {
 # LV2
 # mono
 cd "$srcdir/500SERIES/$_plugin/$_arch/plugin_binaries/LV2/$_pluginname1.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname1.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname1.lv2/$i"
 done
 # stereo
 cd "$srcdir/500SERIES/$_plugin/$_arch/plugin_binaries/LV2/$_pluginname2.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done

 # VST
 cd "$srcdir/500SERIES/$_plugin/$_arch/plugin_binaries/VST"
 # mono
 install -Dm755 "$_plugin-1.so" "$pkgdir/usr/lib/lxvst/$_plugin-1.so"
 # stereo
 install -Dm755 "$_plugin-2.so" "$pkgdir/usr/lib/lxvst/$_plugin-2.so"

 cd "$srcdir/500SERIES/$_plugin"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$_vendor-$_plugin/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/$_vendor-$_plugin/license.pdf"
}

prepare() {
 _plugin=DYN500
 _prepare
 _plugin=EQ500
 _prepare
 _plugin=GT500
 _prepare
}

package() {
 ##########
 # DYN500 #
 ##########
 _plugin=DYN500
 _pluginname1=dyn1-500
 _pluginname2=dyn2-500
 _package


 #########
 # EQ500 #
 #########
 _plugin=EQ500
 _pluginname1=eq1-500
 _pluginname2=eq2-500
 _package


 #########
 # GT500 #
 #########
 _plugin=GT500
 _pluginname1=gt1-500
 _pluginname2=gt2-500
 _package
}
