# Contributor Paolo Giangrandi <peoro.noob@gmail.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Maintainer: Marvn <mistrmarvn@gmail.com>

pkgname=blobandconquer
pkgver=20120620
pkgrel=1
pkgdesc="Episode II of Blob Wars, a 3D action game featuring a variety of different weaponry and multiple objectives."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/blobandconquer/"
license="GPL"
options=('docs')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'mesa')
makedepends=('git')
source=('http://ftp.frugalware.org/pub/frugalware/frugalware-stable/source/games-extra/blobandconquer/blobAndConquer-1.11-1.tar.gz')
md5sums=('bf719a5663d7442f207f1009242c3c2c')
_gitroot="git://blobandconquer.git.sourceforge.net/gitroot/blobandconquer/blobandconquer"
_gitname="blobandconquer"

build() {

msg "Connecting to GIT server...."

	cd "${srcdir}"

	[ -d $_gitname ] && {
		cd $_gitname
		git pull origin
		cd ..

		msg "Local files have been updated."
	} || {
		git clone $_gitroot
	}

	msg "GIT checkout done"


  cd $startdir/src/blobAndConquer-1.11
  mv music/ sound/ $startdir/src/blobandconquer
  cd $startdir/src/blobandconquer
  make -lX11
}

package() {
  cd $startdir/src/blobandconquer
  install -d $startdir/pkg/usr/share/{applications,icons}
  make DESTDIR="${pkgdir}" install
  mkdir -p $pkgdir/usr/bin/
  install -D -m 755 $srcdir/blobandconquer/blobAndConquer $pkgdir/usr/bin/
}
