# Maintainer: Vinzenz Vietzke <vinz@archlinux.us>
# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=tweetr
pkgver=3v4
pkgrel=2
pkgdesc="A lightweight Twitter client with direct webcam access."
arch=('i686' 'x86_64')
url="http://www.tweet-r.com/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=("http://www.tweet-r.com/_old/updates/Tweetr${pkgver}.air" "tweetr.desktop" "tweetr.sh")
md5sums=('85a64a2849acfcacec162d82fcf82e02'
         '2ffbdcd2973533581068282a84519a6e'
         'f0487eccc17d882b08a6a8c2de5f18ac')

build()
{
   cd ${srcdir}
   install -d ${pkgdir}/{opt/${pkgname},usr/{bin,share/{applications,pixmaps}}}
   unzip Tweetr${pkgver}.air 
   install -Dm644 ${srcdir}/Tweetr${pkgver}.air ${pkgdir}/opt/tweetr/tweetr.air
   install -Dm755 ${srcdir}/tweetr.sh ${pkgdir}/usr/bin/tweetr
   install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
   install -Dm644 icons/tweetr48.png ${pkgdir}/usr/share/pixmaps/tweetr.png

}


