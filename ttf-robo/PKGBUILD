# Contributor: Anonymo <meowdib @ gmail.com>

pkgname=ttf-robo
pkgver=20101020
pkgrel=1
pkgdesc="A font inspired by the typeface used in Revell's line of Japanese robot model kits called Robotech Defenders."
arch=('any')
license=('Open Font License')
url="http://purdydesign.com/font_robo.htm"
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://download345.mediafire.com/86sjaep6d3cg/oyds7byw2003ati/ttf-robo.tar.bz2)
sha256sums=('7217d55a82c76f076af71640762d08a8629d4ffe61b4e7f46e95692e154ecbe2')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}
