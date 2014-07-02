# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=black-eq
_pluginrealname=BLACK-EQ
pkgname=linuxdsp-$_pluginname
pkgver=1.0.4
pkgrel=1
pkgdesc="linuxdsp black eq graphical equaliser (jack, lv2, linuxvst)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname/$pkgname.tar.gz")
sha512sums=('186436f95be503726868e449873096eb4373235450f6e97db4813a15a855f7f7b12e8cfe7c96caeb8e6aa28b2317c4e49a31b8c07774df81ca18bb4046580426')

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
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/${_pluginname}1.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/${_pluginname}1.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/${_pluginname}1.lv2/$i"
 done
 # stereo
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/${_pluginname}2.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/${_pluginname}2.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/${_pluginname}2.lv2/$i"
 done

 # VST
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/VST"
 # mono
 install -Dm755 "${_pluginname}1.so" "$pkgdir/usr/lib/lxvst/${_pluginname}1.so"
 # stereo
 install -Dm755 "${_pluginname}2.so" "$pkgdir/usr/lib/lxvst/${_pluginname}2.so"

 # JACK
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/JACK"
 install -Dm755 "${_pluginname}2-$_arch" "$pkgdir/usr/bin/${pkgname}2"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
