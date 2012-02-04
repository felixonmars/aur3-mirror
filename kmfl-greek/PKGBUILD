# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=kmfl-greek
pkgver=20080212
pkgrel=2
pkgdesc="SIL Greek polytonic precomposed keymap for KMFL"
arch=("i686" "x86_64")
url="http://scripts.sil.org/CMS/scripts/page.php?site_id=nrsi&item_id=KeymanKeyboardLinks"
license=("unknown")
depends=("scim-kmfl-imengine")
source=("http://scripts.sil.org/CMS/scripts/render_download.php?site_id=nrsi&format=file&media_id=GrkPolyComp_Src&filename=GrkPolyComp_Src.zip" \
        "fixups.patch" \
	"GrkPolyComp.png")
md5sums=('5e7bf6186a3917d796f1abb710bed539'
         'f9406ee21e769da43f708d798f5348f4'
         '20ecb562f4867c08178ec4ebf758f81e')

build() {
  cd "$srcdir/GrkPolyComp_Src"
  install -d "$pkgdir/usr/share/scim/kmfl/icons" "$pkgdir/usr/share/doc/kmfl"
  tr -d '\r' <GrkPolyComp.KMN >tmp
  mv tmp GrkPolyComp.KMN
  patch GrkPolyComp.KMN -Ni ../fixups.patch -l
  cp ../GrkPolyComp.png .
  kmflcomp GrkPolyComp.KMN # To check that it works
  install -m644 GrkPolyComp.kmfl "$pkgdir/usr/share/scim/kmfl/"
  #install -m644 GrkPolyComp.KMN "$pkgdir/usr/share/scim/kmfl/GrkPolyComp.kmn"
  install -m644 GrkPolyComp.png "$pkgdir/usr/share/scim/kmfl/icons/GrkPolyComp.png"
  install -m644 "Greek Poly Comp Kbrd Layout.pdf" $pkgdir/usr/share/doc/kmfl
}

