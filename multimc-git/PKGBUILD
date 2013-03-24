# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Alexander Duscheleit <jinks@archlinux.us>
pkgname=multimc-git
pkgver=20130324
pkgrel=1
pkgdesc="A Minecraft tool that allows you to manage multiple installations."
arch=('i686' 'x86_64')
url="http://forkk.net/MultiMC4/"
license=('Apache')
depends=('curl' 'wxgtk2.9')
makedepends=('git' 'cmake')
source=('multimc.sh')
sha512sums=('397f370bc52e6afefe83789827aa560495c300591cc388a4919eb00121e943706e89d45ab54cc09833dc2893c8786a0d16619c7ccfb26fef30fcba13e6e8ada3')

_gitroot=git://github.com/Forkk/MultiMC4.git
_gitname=MultiMC4

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
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  sed -i -e 's|cmake ../src|cmake -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.9 ../src|' configure.sh
  ./configure.sh
  cd build
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
 install -D MultiMC $pkgdir/usr/lib/multimc/MultiMC
 install -D $srcdir/multimc.sh $pkgdir/usr/bin/multimc
}

# vim:set ts=2 sw=2 et:
