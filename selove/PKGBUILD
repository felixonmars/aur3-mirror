# Maintainer: Bart van Strien <bart.bes@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >, dreeze
pkgname=selove
pkgver=0.8.0
_pkgcommit=0acf6ae7effa
pkgrel=1
pkgdesc="An open-source 2D game engine which uses the versatile Lua scripting language to create dynamic gaming experiences, security enhanced version"
arch=(i686 x86_64)
url="http://love2d.org/"
license=('zlib')
depends=('luajit' 'physfs' 'freetype2' 'devil' 'mpg123' 'openal' 'libvorbis' 'libmodplug' 'sdl')
source=("https://bitbucket.org/gvx/selove/get/${_pkgcommit}.tar.gz")
md5sums=('05aa9f072677d23809f1b6d574f6a4c1')

build() {
  cd "$srcdir"/gvx-selove-$_pkgcommit/src/scripts
  msg "Generating scripts"
  luajit auto.lua boot graphics sandbox audio
  cd ../..

  msg "Generating configure"
  ./platform/unix/automagic
  msg "Configuring"
  ./configure --prefix=/usr --with-luajit --program-prefix=se #LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
  msg "Making"
  make
}

package() {
  cd "$srcdir"/gvx-selove-$_pkgcommit

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
