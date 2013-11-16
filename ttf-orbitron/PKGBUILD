# Original Maintainer: Mike Redd <mredd@0tue0.com>
# New Mainteiner: Patrick H. <gondlar@gmx.de>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-orbitron
_realname=Orbitron
pkgver=1
pkgrel=2
pkgdesc="Orbitron is a geometric sans-serif typeface intended for display purposes. by: Matt McInerney"
arch=('any')
license=('OFL')
url="http://www.google.com/webfonts/family?family=Orbitron&subset=latin#description"
_url="http://s3.amazonaws.com/theleague-production/fonts/orbitron.zip?1259853388"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/$_realname.zip" "http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt")

md5sums=('64f4966fc00f5396bea757f391e6cdf4'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $_realname/TTF/*.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
