pkgname=xnoise-git
pkgver=20130702
pkgrel=1
pkgdesc="Development branch of the Xnoise media player"
arch=('any')
url="https://www.xnoise-media-player.com"
license=('GPL')
depends=('desktop-file-utils' 'gst-plugins-base' 'gtk3' 'librsvg' 'libsoup' 'sqlite' 'libtaginfo-git')
makedepends=('gettext' 'git' 'gnome-common' 'gnome-icon-theme' 'intltool' 'vala')
optdepends=('gst-plugins-good: Extra media codecs'
	    'gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
	    'gst-libav: Extra media codecs'
	    'gvfs: Album art fetching')
conflicts=('xnoise')

_gitroot="https://bitbucket.org/shuerhaaken/xnoise.git"
_gitname="xnoise"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build || return 1

  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
  ./autogen.sh
  make
  make DESTDIR="$pkgdir" install
}