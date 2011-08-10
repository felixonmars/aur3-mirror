# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=compiz-fusion-plugin-headtracking-git
pkgver=20110810
pkgrel=1
pkgdesc="Gives you a real 3d desktop with a webcam or Wiimote."
arch=(i686 x86_64)
url="http://www.compiz.org/"
license=('GPL')
depends=('compiz-core' 'opencv')
makedepends=('compiz-bcop')
makedepends=('git')

_gitroot="git://anongit.compiz.org/users/klange/headtracking"
_gitname="headtracking"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  # path, link and other stuff fixes
  sed -e "76 s|\`pkg-config --variable=xsltdir compiz-gconf\`|$pkgdir/usr/share/compiz|g" \
      -e "206 s|\`pkg-config --variable=xsltdir compiz-gconf\`|/usr/share/compiz|g" \
      -e "/gconftool-2/d" -e "s|\(\$(XMLDIR\)|$pkgdir\1|" \
      -e "s| \$(DATADIR)| $pkgdir\$(DATADIR)|" \
      -e "s|\$(PKG_DEP)|opencv|g" \
      -e "s|-lcxcore.*||" \
      -i Makefile

  # Patch not needed anymore since merged in the git by soreau (20100620)
  # sed '264 s_\(capture\)_\1, 0_' -i facedetect.c || return 1

  # Patch due to 2.2 api changes for face detect -> merged
  # sed -i "s|cvSize(30|cvSize(0, 0), &|" facedetect.c

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make BUILD_GLOBAL=true DESTDIR="$pkgdir/usr/lib/compiz" install
} 
