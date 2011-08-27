# Contributor: Dmitry ixaphire_at-gmail-dot+com
# Contributor: Nicolò Barbon smilzoboboz_at-gmail-dot+com

pkgname=youtube-srt
pkgver=0.2
pkgrel=1
pkgdesc="Youtube subtitle fetcher (srt format)"
arch=('i686' 'x86_64')
url="http://none"
depends=("libxslt" "wget")
source=("youtube-srt" "youtubesrt.xsl" "youtubelang.xsl")
license=('GPL')
md5sums=("a3e27777410ab7a52fd9a7ff5b6e7fe8" \
         "b21d010a93a4f218ce6f5bf30b844cda" \
         "dcc574db3d7a6afc5db9de5147f47a0e")

build() {
  cd ${srcdir}
  install -D -m755 youtube-srt "$pkgdir/usr/bin/youtube-srt" || return 1
  install -D -m644 youtubesrt.xsl "$pkgdir/usr/lib/youtube-srt/youtubesrt.xsl" || return 1
  install -D -m644 youtubelang.xsl "$pkgdir/usr/lib/youtube-srt/youtubelang.xsl" || return 1
}
