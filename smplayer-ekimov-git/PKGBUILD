pkgname=smplayer-ekimov-git
pkgver=20110305
pkgrel=1
pkgdesc="Clone of SMPlayer for bug fixing"
arch=(i686 x86_64)
url="http://gitorious.org/ekimov-smplayer/"
license=('GPL')
conflicts=(smplayer)
depends=('qt>=4.7.1' 'mplayer')
provides=(smplayer)
_gitroot="git://gitorious.org/ekimov-smplayer/ekimov-smplayer.git"
_gitname="ekimov-smplayer"

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
  cd $srcdir/$_gitname
  # remove broken translation
  # sed -i "s|translations/smplayer_gl.ts|#translations/smplayer_gl.ts|" src/smplayer.pro

  make PREFIX=/usr
  make PREFIX=${pkgdir}/usr install

  install -dm755 ${pkgdir}/usr/share/pixmaps
  ln -s /usr/share/icons/hicolor/64x64/apps/smplayer.png \
        ${pkgdir}/usr/share/pixmaps/

  sed -i 's|Exec=smplayer %U|Exec=smplayer %F|' ${pkgdir}/usr/share/applications/smplayer.desktop
  sed -i 's|Exec=smplayer -add-to-playlist %U|Exec=smplayer -add-to-playlist %F|' \
  	${pkgdir}/usr/share/applications/smplayer_enqueue.desktop
} 
