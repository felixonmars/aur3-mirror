# Contributor: cryostasix <cryostasix@gmail.com>
 
pkgname=lib32-luafilesystem
pkgver=1.5.0
pkgrel32=1
pkgrel=2
pkgdesc="File System Library for the Lua Programming Language"
arch=('x86_64')
url="http://www.keplerproject.org/luafilesystem/"
depends=(lib32-lua)
license=('MIT')
groups=lib32
source=(ftp://ftp.archlinux.org/community/os/i686/${pkgname/lib32-/}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz)
md5sums=('54bf4ed3abe6905fc0bbfb361e001b3d')
 
build() {
  mkdir -p ${startdir}/pkg/opt/lib32/usr/lib/lua/5.1/
  cp -rPf ${startdir}/src/usr/lib/lua/5.1/*.so* ${startdir}/pkg/opt/lib32/usr/lib/lua/5.1/
}
 
