# Contributor: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>
# Contributor: Berkus <berkus@madfire.net>
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Valeth <aranemnon@gmail.com>

pkgname=jack-rack-git
pkgver=20130328
pkgrel=2
pkgdesc="Effects rack for JACK"
url="http://jack-rack.sourceforge.net/"
arch=(i686 x86_64)
license="GPL"
depends=('git' 'cairo' 'lash' 'liblrdf')
provides=('jack-rack')
conflicts=('jack-rack')
_gitroot="git://jack-rack.git.sourceforge.net/gitroot/jack-rack/jack-rack"
_gitname="jack-rack"

build() {

  cd "$srcdir"
  msg "Connecting to git.sv.gnu.org..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  ./autogen.sh
  #./configure  --prefix=/usr --disable-gnome
   
  LDFLAGS+=' -lm -ldl' ./configure --prefix=/usr --enable-lash --disable-gnome
  make
}

package() {

  cd "$srcdir/$_gitname-build"

  make DESTDIR=${pkgdir} install
}

