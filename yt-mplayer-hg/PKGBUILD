# Contributor portix

pkgname=yt-mplayer-hg
pkgver=44
pkgrel=1
pkgdesc="yt-mplayer" 
url="http://bitbucket.org/portix/yt-mplayer" 
arch=('i686' 'x86_64')
license=('GPL')
depends=('libwebkit' 'mplayer' 'gtk2')
provides=(yt-mplayer)
conflicts=(yt-mplayer)
makedepends=('pkgconfig' 'mercurial')

_hgroot="https://bitbucket.org/portix"
_hgrepo="yt-mplayer"

build() {
  cd ${srcdir}/${_hgrepo}
  rm -rf $srcdir/$_hgrepo-build
  cp -a ${srcdir}/${_hgrepo} ${srcdir}/${_hgrepo}-build
  cd ${srcdir}/${_hgrepo}-build
  make 
}
package() {
  cd ${srcdir}/${_hgrepo}-build
  make DESTDIR=${pkgdir} install 
}
