# Original Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Alexander "butterbrot" Hausmann <alexander-hausmann@web.de>
# Contributor: Jakob "flocke" Nixdorf <flocke@user-helfen-usern.de>

pkgname=0ad-svn
pkgver=12951
pkgrel=1
pkgdesc="Cross-platform, 3D and historically-based real-time strategy game"
arch=('i686' 'x86_64')
url="http://wildfiregames.com/0ad"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost' 'crypto++' 'devil' 'enet>=1.3.0' 'gamin' 'libogg' 'libpng' 'libvorbis' 'libxml2' 'mesa' 'nasm>2.06' 'openal' 'sdl' 'wxgtk' 'zlib')
makedepends=('subversion' 'gcc>=4.3' 'cmake')
options=('!makeflags')
source=('boost-mt-fix.patch')
md5sums=('0ca5f80c1fb0f0f4c42365580c8c61d8')

_svntrunk="http://svn.wildfiregames.com/public/ps/trunk"
_svnmod="trunk"

build() {
msg "Creating start script..."
    create_start_script

msg "Starting SVN checkout..."
  cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
    else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi
msg "SVN checkout done or server timeout"

msg "Creating build copy..."
  if [ -d ${srcdir}/$_svnmod-build ]; then
    rm -rf $_svnmod-build
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

msg "Applying boost-mt fix..."
  cd build/premake
  patch -uN extern_libs4.lua < ../../../../boost-mt-fix.patch
  cd ../../

msg "Updating Workspaces..."
  cd ${srcdir}/$_svnmod-build/build/workspaces
  ./update-workspaces.sh #--with-system-enet

msg "Building 0AD..."
  cd ${srcdir}/$_svnmod-build/build/workspaces/gcc
  make
}

package(){
msg "Installing binaries..."
  install -d ${pkgdir}/opt/0ad
  cp -r ${srcdir}/$_svnmod-build/binaries/* ${pkgdir}/opt/0ad

msg "Removing SVN stuff..."
  cd ${pkgdir}/opt/0ad
  find -name ".svn" -type d -print0 | xargs -0 rm -rf

msg "Removing sucky windows stuff..."
  cd ${pkgdir}/opt/0ad/system
  rm {*.exe,*.dll,*.bat,Microsoft.VC*,*.sys,*.pdb}
  rm -rf {ape,textureconv}

msg "Fixing file permissions..."
  cd ${pkgdir}/opt/0ad/data
  chown -R root:games ${pkgdir}/opt/0ad

msg "Installing run script..."
  install -D -m755 ${srcdir}/$pkgname.sh ${pkgdir}/usr/bin/$pkgname
}

create_start_script(){
cat >> ${pkgname}.sh  << __EOF__
#!/bin/sh
cd /opt/0ad/system
./pyrogenesis $*
__EOF__
}
