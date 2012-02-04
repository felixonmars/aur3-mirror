pkgname=ttf-nuosu-sil
pkgver=2.1.1
pkgrel=1
pkgdesc="A Unicode font for the standardized Yi script."
arch=('any')
url="http://scripts.sil.org/SILYi_home"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=NuosuSIL2.1.1.zip&filename=NuosuSIL2.1.1.zip')
md5sums=('50570ee6e8d5a8f338ab7d95f3c9eee5')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/NuosuSIL/NuosuSIL.ttf $pkgdir/usr/share/fonts/TTF
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/NuosuSIL/OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

