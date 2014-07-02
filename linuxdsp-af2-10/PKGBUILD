# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pluginname=af2-10
_pluginname2=af210
_pluginrealname=AF210
pkgname=linuxdsp-$_pluginname
pkgver=1.0.0
pkgrel=1
pkgdesc="linuxdsp af2-10 graphical eq with fft (jack, lv2)"
arch=('i686' 'x86_64')
url="http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname2/index.html"
license=('custom')
groups=('linuxdsp')
depends=('gcc-libs' 'libx11')
optdepends=('jack: standalone app')
install=linuxdsp.install
source=("http://www.linuxdsp.co.uk/download/lv2/download_$_pluginname2/$pkgname.tar.gz")
sha512sums=('39af17aabcb7ddb231a6d1cdd86504677c6548007bcadfdb7bc61f538e0aa284ee32cba051827ee7778978a623a483b441a7068a0c0818216778f44b93733c03')

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
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/LV2/$_pluginname2.lv2"
 for i in *ttl
 do
  install -Dm644 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done
 for i in *so
 do
  install -Dm755 "$i" "$pkgdir/usr/lib/lv2/$_pluginname2.lv2/$i"
 done

 # JACK
 cd "$srcdir/$_pluginrealname/$_arch/plugin_binaries/JACK"
 install -Dm755 "$_pluginname2-$_arch" "$pkgdir/usr/bin/$pkgname"


 cd "$srcdir/$_pluginrealname"
 install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$pkgname/manual.pdf"
 install -Dm644 license.pdf "$pkgdir/usr/share/licenses/$pkgname/license.pdf"
}
