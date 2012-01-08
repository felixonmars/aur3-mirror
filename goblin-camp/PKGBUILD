# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=goblin-camp
pkgver=2039
pkgrel=1
pkgdesc="Goblin Camp is a roguelike citybuilder, inspired by Anno 1404, Dwarf Fortress and Dungeon Keeper."
arch=('i686' 'x86_64')
url="http://www.goblincamp.com/"
license=('GPL3')
makedependes=('boost-build')
depends=('libgl' 'python2' 'sdl_image')
source=(gc-config.jam)
md5sums=('18bd877061925bfbf4f3478135c165d2')

_hgroot="https://bitbucket.org/genericcontainer"
_hgrepo="$pkgname"

build() {
  _dest_dir="$pkgdir/usr/share/$pkgname"
  mkdir -p $_dest_dir


	cd $srcdir
	msg "Connecting to hg server..."
	if [[ -d "$_hgrepo/.hg" ]]; then
		msg "pull"
		( cd $_hgrepo && hg pull -u )
	else
		msg "clone"
		hg clone "${_hgroot}/${_hgrepo}"
	fi
  
  cd $pkgname


  if test "$CARCH" == x86_64; then
    bjam --user-config=../../gc-config.jam -j2 release address-model=64
    cp -r build/bin-release-x64/{bin,share} $_dest_dir/
  else
    bjam --user-config=../../gc-config.jam -j2 release address-model=32
    cp -r build/bin-release-x86/{bin,share} $_dest_dir/
  fi



  chown -R :games $_dest_dir
  chmod -R g+rw $_dest_dir

  mkdir $pkgdir/usr/bin
  ln -s $_dest_dir/bin/$pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
