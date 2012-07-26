# Contributor: Si Snow <si@sisnow.im>

pkgname=dnt
pkgver=git
pkgrel=1
pkgdesc="A free sarcastic 3D single player RPG set in a post-apocalyptical world"
arch=('i686' 'x86_64')
url="http://dnt.dnteam.org/"
license=('custom')
depends=('cal3d' 'openal' 'libgl' 'sdl_image' 'sdl_ttf' 'libvorbis' 'mesa')
makedepends=('git')
source="dnt.desktop"
md5sums="ef3e7aba1570058d6a4f704f7fdefdaf"

build() {
  # Get from Git
  msg "Cloning git repo..."
  git clone git://git.code.sf.net/p/dnt/code $srcdir/git
  msg "Finished cloning!"

  # Configure
  cd $srcdir/git
  msg "Generating configure..."
  autoconf
  msg "Configuring..."
  ./configure --prefix=/usr
  msg "Ready to compile!"

  # Compile
  msg "Compiling..."
  make
  mkdir -p "$pkgdir"/usr/bin
  make prefix="$pkgdir"/usr install
  msg "Compiled."

  cd $srcdir
  install -D -m644 $srcdir/dnt.desktop $pkgdir/usr/share/applications/dnt.desktop
}

# vim:set ts=2 sw=2 et:
