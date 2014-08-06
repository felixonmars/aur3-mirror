# Submitter: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=soundfont-toh
pkgver=2.0.2
pkgrel=1
pkgdesc="Don Allen's Timbres of Heaven soundfont"
arch=('i686' 'x86_64')
url="http://midkar.com/soundfonts/"
license=('custom')
source=("http://midkar.com/soundfonts/TOH_$pkgver.zip"
	"LICENSE"
	)
md5sums=('d7ef49ac5f55b7b8f62ad92a74b857ef'
         '55561bdb679f1c6653bce81cad2c5d83')

package() {
  install -Dm0644 "$srcdir/Timbres Of Heaven GM_GS_XG_SFX V $pkgver.sf2" "$pkgdir/usr/share/soundfonts/Timbres Of Heaven GM_GS_XG_SFX V $pkgver.sf2"
  install -Dm0644 "$srcdir/Timbres Of Heaven GM_GS_XG_SFX V $pkgver.txt" "$pkgdir/usr/share/doc/soundfont-toh/Timbres Of Heaven GM_GS_XG_SFX V $pkgver.txt"
  install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/soundfont-toh/LICENSE"
}
