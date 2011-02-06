# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-league-gothic
pkgver=1
pkgrel=2
pkgdesc="A sans-serif Gothic typeface"
arch=('any')
url="http://www.theleagueofmoveabletype.com/fonts/7-league-gothic"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=('http://s3.amazonaws.com/theleague-production/fonts/league-gothic.zip')

build() {
    cd $startdir/src
    install -Dm 644 "League Gothic/League Gothic.otf" $pkgdir/usr/share/fonts/TTF/leaguegothic.otf
}
md5sums=('72b228695f1ad8ac0e3824a1e7edb313')
