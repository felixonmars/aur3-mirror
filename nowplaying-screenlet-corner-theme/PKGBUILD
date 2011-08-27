# Contributor: twa022 <twa022@gmail.com>

pkgname=nowplaying-screenlet-corner-theme
pkgver=0.3
pkgrel=1
pkgdesc="Corner themes for NowPlaying screenlet"
arch=('any')
url="http://gnome-look.org/content/show.php/Corner+4+Nowplaying?content=107552"
license=('cc-by-nc-sa')
depends=('screenlets')
source=(http://www.deviantart.com/download/127319208/Corner_4_Nowplaying_by_narf41.zip)
md5sums=('6fccd99527e6e0a31448bb7542e075e8')
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')

build() {
  cd $srcdir
  for _subfolder in `ls ${srcdir}/themesinside` ; do
    mkdir -p $pkgdir/usr/share/screenlets/NowPlaying/themes/${_subfolder}
    install -m644 $srcdir/themesinside/${_subfolder}/* $pkgdir/usr/share/screenlets/NowPlaying/themes/${_subfolder}
  done
}
