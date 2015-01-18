# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sub-renamer
pkgver=0.3
pkgrel=1
pkgdesc="Rename subtitles (heuristically) to match the video files across directories."
arch=('any')
url="https://github.com/trizen/perl-scripts/blob/master/File%20Workers/sub_renamer.pl"
license=('GPLv3')
depends=('perl>=5.14.0')
source="https://raw.githubusercontent.com/trizen/perl-scripts/master/File%20Workers/sub_renamer.pl"
md5sums=('7c494170aacaae80f5cdcdcf6c1d5e89')

package() {
  install -Dm 755 "$srcdir/sub_renamer.pl" "$pkgdir/usr/bin/$pkgname"
}
