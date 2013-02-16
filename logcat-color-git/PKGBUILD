# Maintainer: Rick Chen <stuffcorpse@archlinux.us>
pkgname=logcat-color-git
pkgver=20130216
pkgrel=1
pkgdesc="A colorful and highly configurable alternative to the adb logcat command from the Android SDK."
arch=(any)
url="https://github.com/marshall/logcat-color"
license=('Apache')
depends=('python2' 'python2-colorama')
makedepends=('git')
provides=('logcat-color')
options=(!emptydirs)
install=
changelog=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/marshall/logcat-color.git"
_gitname="logcat-color"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    cd "$srcdir"
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/logcat-color"
  python2 setup.py build
}

package() {
  cd "$srcdir/logcat-color"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
