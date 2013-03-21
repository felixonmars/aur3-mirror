# Contributor: David Mikalova <dmikalova@gmail.com>

pkgname=ttf-padauk
pkgver=2011.02.10
pkgrel=2
pkgdesc="Padauk is a Unicode 6 font supporting all the Myanmar characters, including Burmese and minority languages."
url="http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=Padauk"
license=('SIL OFL')
arch=('any')
depends=('freetype2' 'libxft' 'fontconfig')
install=$pkgname.install
source=("http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Mh_Padauk_zip&filename=padauk-2.8.zip")
md5sums=('5601d47d09ea76d271abd624638a3c5b')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
#   cd "$srcdir"
#   unzip "./render_download.php?format=file&media_id=Mh_Padauk_zip&filename=padauk-2.8.zip"
  cp "$srcdir/padauk-2.80/Padauk.ttf" "$pkgdir/usr/share/fonts/TTF/"
  cp "$srcdir/padauk-2.80/Padauk-bold.ttf" "$pkgdir/usr/share/fonts/TTF/"
  cp "$srcdir/padauk-2.80/Padauk-book.ttf" "$pkgdir/usr/share/fonts/TTF/"
  cp "$srcdir/padauk-2.80/Padauk-bookbold.ttf" "$pkgdir/usr/share/fonts/TTF/"
}