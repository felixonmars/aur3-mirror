# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=guitar-fx
_pkgname2=guitar_fx
_pkgname3=GUITAR_FX
_vendor=linuxDSP
pkgname=linuxdsp-$_pkgname
pkgver=1
pkgrel=1
pkgdesc="linuxdsp guitar fx (jack, lv2)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pkgname2/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pkgname2/$_pkgname-lv2.zip")
sha512sums=('3427ec4af25251b65d0add3b995b511efec6fccd09b87b335728e228760e1228bd0653f75c341a7e7227a6ae4d250c94e9a02c49807527223b2ad4cae5173003')

if [ "$CARCH" = 'i686' ]; then
 _arch=x86
elif [ "$CARCH" = 'x86_64' ]; then
 _arch=x86-64
fi

_package() {
 # LV2
 cd "$srcdir/$_pkgname3/$_plugin/LV2/$_arch/$_pluginname.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname.lv2/$i"
 done

 # JACK
 cd "$srcdir/$_pkgname3/$_plugin/JACK/$_arch"
 install -Dm755 "$_pluginname-$_arch" "$pkgdir/usr/bin/$_vendor-$pluginname"

 cd "$srcdir/$_pkgname3/$_plugin"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$_vendor-$_plugin/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/$_vendor-$_plugin/license.pdf"
}

prepare() {
 # consistency would have been a nice thing.. ;)
 cd "$srcdir//GUITAR_FX/DT1"
 mv dt1_manual.pdf manual.pdf
 cd "$srcdir//GUITAR_FX/PH1"
 mv ph1_manual.pdf manual.pdf
 cd "$srcdir//GUITAR_FX/WAH1"
 mv wah1_manual.pdf manual.pdf
}

package() {
 #######
 # CR1 #
 #######
 _plugin=CR1
 _pluginname=cr1
 _package

 #######
 # DT1 #
 #######
 _plugin=DT1
 _pluginname=dt1
 _package

 #######
 # PH1 #
 #######
 _plugin=PH1
 _pluginname=ph1
 _package

 ########
 # WAH1 #
 ########
 _plugin=WAH1
 _pluginname=wah1
 _package
}
