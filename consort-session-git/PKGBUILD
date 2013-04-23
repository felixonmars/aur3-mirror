pkgname=consort-session-git
pkgver=20130422
pkgrel=0
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="The Consort session"
url="https://bitbucket.org/consortdesktop/consort-session"
depends=('consort-panel-git' 'consortium-git')
makedepends=()
install=consort-session.install
groups=('consort')
options=('!libtool' '!emptydirs')

_gitroot=https://bitbucket.org/consortdesktop/consort-session
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
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/share/xsessions/
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/gnome-session/sessions 
  mkdir -p $pkgdir/usr/share/glib-2.0/schemas/
  cp consort.desktop $pkgdir/usr/share/xsessions/
  cp consort-session $pkgdir/usr/bin
  cp consort.session $pkgdir/usr/share/gnome-session/sessions 
  cp org.consort.desktop.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/
}
