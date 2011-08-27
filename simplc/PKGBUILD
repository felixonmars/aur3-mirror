#Contributer: Charles Cagle <ccagle8 at mail dot gatech dot edu>
pkgname=simplc
pkgver=2.1.1b2
pkgrel=2
pkgdesc="a multi-ISA assembly debugger with graphical and terminal frontends"
arch=('x86' 'x86_64')
url="http://sourceforge.net/projects/simplc/"
license=('BSD' 'GPL')
depends=('qt3')
conflicts=('lc3tools')
source=('http://sourceforge.net/projects/simplc/files/simplc-src/2.1.1b2/simp2.1.1b2.tar.gz/download'
        'common.h.patch'
        'simpl.desktop')
build() {
  cd "$srcdir/simpl-src"
  patch common.h "$srcdir/common.h.patch"
  echo "INSTALL=n
	QTLIB=\"-L/opt/qt/lib\"
	QTLIBDIR=\"/opt/qt/lib\"
	QTINC=\"-I/opt/qt/include\"
	QTINCDIR=\"/opt/qt/include\"
	MOC=\"/opt/qt/bin/moc\"" > .options
  ./config.sh
  make || return 1

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"

  install simp lc3as gt16text gt16as simpl "$pkgdir/usr/bin"
  install README.CS2110 README "$pkgdir/usr/share/doc/$pkgname"
  install LICENSE COPYING "$pkgdir/usr/share/licenses/$pkgname"
  install hi16-app-simpl.png "$pkgdir/usr/share/pixmaps/simplc_16.png"
  install "$srcdir/simpl.desktop" "$pkgdir/usr/share/applications"
}
md5sums=('31c419db60576df42acba5f23a5987c5'
         '575ab7fb4e634f3b9823554bc19cc202'
         'b93c31cf82a7fbe9a05e8c8bd23c6837')
sha1sums=('fe352dbcea40695fe0c5cf7e4826e215a4933d17'
          '9dd55ac371f35383e0c034c676b2f03899746bb0'
          'f3784fa8d5f3eae75a7e0cad71b4fb05968f90ab')
sha256sums=('51609bcb167010222a86facd2faae9c57e52925a469a20e48651a6aa8dc21cb7'
            '43b241bb7785540a03b7faf4aa6f3a8446fcc0b38dddf69be23841867e7f34b1'
            '08af5e4404ab1a9d3a8683a9fddf9dfa02fcbd92b7e2e13b8dd069263bc63244')
sha384sums=('e9e113976b5bb17e44a4a93536bab5c8107609df8b9c1255bf11602eaee46e43461fd447fb69230c1d509eefc916263d'
            'bcca29ade3f3c40af573664cd1dcedc865df6f6b8043219d2821b67b6505fe58e101da3b92993217115ec91a2f9c1af5'
            '120852ea986effde6b38617797dd22afafc7757682de7893b579d307d311715942974d33cc75178b76c8ea7fdaf523ca')
sha512sums=('faac1f3da89d3b0da097741ee89fb363f99ccc35d869b219276b84f31430df64cb7d8417cc7d9e5a1d5f72ce50fdfac66333ae0c8f44edff67f536fe0fd9dec8'
            'dee2762909c6af9724821bab814c7f3c4cfc9a37b30ace94da1894f672c6e25b094585c62849fca83db55311fac570220910170fcf0fb8427df1ac96b1f6b99f'
            '0f70335a1a5af4bf7985b01bc24283f70dcec758da7f56e377b60feb6a5b87955a572007c8bf283d0cddf9cf41bb5a9062a20b520dcc8d69d7295a9777eff495')
