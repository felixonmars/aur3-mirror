# Maintainer: karamaz0v <nihilum at gmail.com>
# Contributor: Zachary A. Jones <JazzplayerL9@gmail.com>

pkgname=vesta
pkgver=3.2.1
pkgrel=1
pkgdesc="Visualization for Electronic and Structural Analysis"
url="http://jp-minerals.org/vesta/en"
license=('custom')
arch=("i686" "x86_64")
depends=('cairo' 'gtk2' 'libpng' 'libpng12' 'mesa' 'java-environment' 'libxtst' 'libgnomeui')
options=(!strip)
source=('http://www.geocities.jp/kmo_mma/crystal/download/VESTA-i686.tar.bz2')
[ "$CARCH" = "x86_64" ] && source=('http://www.geocities.jp/kmo_mma/crystal/download/VESTA-x86_64.tar.bz2')
source=("${source[@]}" "${pkgname}.desktop" "vesta-exec")
md5sums=('547528eaaf80f0cf6ddf20fb913331f7'
	 'fdacab295c4872ad4a8105e55eb0c797'
	 '379a199e0e86d5cbbcb25fd99053d7e0')
[ "$CARCH" = "x86_64" ] && md5sums=('c259ccf89e96aa67228826007391068d'
	 'fdacab295c4872ad4a8105e55eb0c797'
	 '379a199e0e86d5cbbcb25fd99053d7e0')

package(){
  cd "${srcdir}"
  install -d "$pkgdir/opt/$pkgname"
  cp -R "$srcdir"/VESTA-$CARCH/* "$pkgdir/opt/$pkgname"
  # create Launcher
  install -d "$pkgdir/usr/bin/"
  install -D -m755 "$srcdir/vesta-exec" "$pkgdir/usr/bin/$pkgname"
  # Install Desktop File and Icon
  install -D -m644 "$srcdir/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$pkgdir/opt/vesta/img/logo.png" \
		"$pkgdir/usr/share/icons/$pkgname-icon.png"
  # Install license
  install -Dm 644 "$pkgdir"/opt/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license
}
