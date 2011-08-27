# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=mistelix-git
pkgver=20110523
pkgrel=1
pkgdesc="Author DVDs and slideshows"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Mistelix"
license=('MIT')
depends=('gstreamer0.10-base-plugins>=0.10.3' 'gstreamer0.10-ffmpeg' 'libgnome-sharp>=2.10' 'mono-addins>=0.3' 'gnome-desktop2' 'xdg-utils')
makedepends=('git' 'intltool>=0.35')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs')
provides=('mistelix')
conflicts=('mistelix')
options=('!libtool')
install=$pkgname.install

_gitroot="git://git.gnome.org/mistelix"
_gitname="mistelix"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
               --disable-static
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}
