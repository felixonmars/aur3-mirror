# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jakob "flocke" Nixdorf <flocke@user-helfen-usern.de>

pkgname=0ad-svn
pkgver=7447
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost' 'crypto++' 'devil' 'enet' 'fam' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'nasm' 'openal' 'sdl' 'wxgtk' 'zlib')
makedepends=('subversion')
options=('!makeflags')
source=($pkgname.sh)
md5sums=('a86da49bf1ccc564997ece02b055fc7e')

_svntrunk="http://svn.wildfiregames.com/public/ps/trunk"
_svnmod="trunk"

build() {
msg "Starting SVN checkout..."
  cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
msg "SVN checkout done or server timeout"

msg "Starting make..."
  if [ -d ${srcdir}/$_svnmod-build ]; then
    rm -r $_svnmod-build
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

msg "Updating Workspaces..."
  cd ${srcdir}/$_svnmod-build/build/workspaces || return 1
  ./update-workspaces.sh || return 1

msg "Building 0AD..."
  cd ${srcdir}/$_svnmod-build/build/workspaces/gcc || return 1
  make || return 1

msg "Installing binaries..."
  install -d ${pkgdir}/opt/0ad || return 1
  cp -r ${srcdir}/$_svnmod-build/binaries/* ${pkgdir}/opt/0ad || return 1

msg "Removing SVN stuff..."
  cd ${pkgdir}/opt/0ad || return 1
  find -name ".svn" -type d -print0 | xargs -0 rm -rf || return 1

msg "Removing sucky windows stuff..."
  cd ${pkgdir}/opt/0ad/system || return 1
    rm *.exe
    rm *.dll
    rm *.bat
    rm Microsoft.VC*
    rm *.sys
    rm *.pdb
    rm -rf ape
    rm -rf textureconv
    rm ../data/createzip.bat

msg "Fixing file permissions..."
  cd ${pkgdir}/opt/0ad/data || return 1
  chown -R root:games ${pkgdir}/opt/0ad || return 1

msg "Installing run script..."
  install -D -m755 ${srcdir}/$pkgname.sh ${pkgdir}/usr/bin/$pkgname || return 1
}
