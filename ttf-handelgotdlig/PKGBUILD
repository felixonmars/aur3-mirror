# Contributor: Philipp Schmitt (attentah@NOSPAM.gmail.com)
pkgname=ttf-handelgotdlig
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="HandelGotDLig TTF Font"
license=('Unknown')
arch=('any')
md5sums=('9cb395c1d3025b7d6ce3551eff4e6e12')
url=('http://www.free-fonts-ttf.org/true-type-fonts/handelgotdlig-3323-download.htm')

source=(http://www.laxlinux.net/files/media/fonts/$pkgname.tar.bz2)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}

