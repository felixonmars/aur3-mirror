#Contributor: Mihai Coman <mihai@m1x.ro>
#Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=consortium-git
_pkgname=consortium
pkgver=20130618
pkgrel=0
pkgdesc="A window manager for Consort"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'gtk3' 'gsettings-desktop-schemas' 'libcanberra'  'libgtop' 'libsm' 'startup-notification' 'zenity')
makedepends=('intltool' 'yelp-tools')
url="https://bitbucket.org/consortdesktop/consortium"
groups=('consort')
options=('!libtool' '!emptydirs')
install=consortium.install

_gitroot=https://bitbucket.org/consortdesktop/consortium
_gitname=master


build() {

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  
  cd "$srcdir/$_gitname-build"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/consortium \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
