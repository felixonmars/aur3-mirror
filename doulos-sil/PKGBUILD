# Contributor: David Hover <ootawata at gmail>
pkgname=doulos-sil
_pkgname=DoulosSIL
pkgver=4.106
pkgrel=1
pkgdesc='A unicode font with IPA characters.'
url="http://scripts.sil.org/"
arch=('i686' 'x86_64')
license=(custom:sil-OFL)
source=("http://scripts.sil.org/cms/scripts/render_download.php?site_id=nrsi&format=file&media_id=${_pkgname}${pkgver}b.zip&filename=${_pkgname}${pkgver}.zip"
        'LICENSE')
md5sums=('db548b9854ce7cc673c94c92d59fd95c'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

build() {
  cd "$srcdir/$_pkgname"
  install -Dm644 DoulosSILR.ttf $pkgdir/usr/share/fonts/TTF/DoulosSILR.ttf || return 1
  install -Dm644 $startdir/LICENSE $pkgdir/usr/share/licenses/doulos-sil/LICENSE || return 1
}
