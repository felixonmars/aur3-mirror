# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# Based on the Arch Linux PKGBUILD by:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Bob Finch <w9ya@arrl.net>

pkgname=dosemu-svn
pkgver=2080
pkgrel=1
pkgdesc="DOS emulator"
arch=('i686' 'x86_64')
url="http://www.dosemu.org/"
license=('GPL' 'custom')
depends=('gpm' 'slang' 'sdl' 'libxxf86vm' 'libsndfile' 'sh' 'xorg-mkfontdir' 'xorg-bdftopcf')
makedepends=('subversion')
conflicts=('dosemu')
provides=('dosemu')
backup=('etc/dosemu/dosemu.conf'
	'etc/dosemu/dosemu.users'
	'etc/dosemu/global.conf')
source=(http://ftp.debian.org/debian/pool/contrib/d/dosemu/dosemu_1.4.0+svn.2010-1.debian.tar.gz
        http://dl.dropbox.com/u/13513277/dosemu/dosemu-freedos-1.1-bin.tgz
        xdosemu.desktop)
sha256sums=('346d017686482981ab6649408d3348dad7cc86c6c12969c6fb81d1c67d084470'
            'fb97efd474b1ad90bfea84d46e7e32c6e51c94da43bbcaccea23d2de775d4621'
            'ae737e26165c016242d5a8603a5c887c313570e1525091b30f9e8d23d1a9faab')
noextract=('dosemu-freedos-1.1-bin.tgz')

_svntrunk='https://dosemu.svn.sourceforge.net/svnroot/dosemu/trunk'
_svnmod="$pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server..."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$pkgname"
  patch -p1 < ../debian/patches/debianize.patch
  patch -p1 < ../debian/patches/spelling-fixes.patch
  patch -p1 < ../debian/patches/manpage-dashes.patch
  patch -p1 < ../debian/patches/force-vm86-emu.patch
  ./configure --prefix=/usr --with-fdtarball="$srcdir/dosemu-freedos-1.1-bin.tgz" --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir"/xdosemu.desktop "$pkgdir"/usr/share/applications/xdosemu.desktop
  install -Dm 644 etc/dosemu.xpm "$pkgdir"/usr/share/icons/dosemu.xpm
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm 644 COPYING.DOSEMU "$pkgdir"/usr/share/licenses/$pkgname/COPYING.DOSEMU
}
