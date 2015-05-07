# $Id: PKGBUILD 188887 2013-06-23 21:49:24Z daniel $
# Maintainer: Daniel Kozak <kozzi11@gmail.com>

_pkgname=monodevelop
pkgname=monodevelop-latest
pkgver=5.9.0.464
pkgrel=1
pkgdesc="An IDE for .NET and D language"

# should probably changed to "any" - no ELF files - OpenSUSE builds it as NOARCH 
arch=('i686' 'x86_64')

url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=3.2' 'mono-addins>=0.6.2' 'gnome-sharp' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('rsync' 'git' 'nuget-cert')
options=(!makeflags)
install=monodevelop.install
source=(git://github.com/mono/monodevelop.git)
provides=(monodevelop)
conflicts=(monodevelop)
md5sums=('SKIP')


build() {

  cd ${srcdir}/${_pkgname}
  git submodule update --init --recursive || return 1
  git checkout tags/$_pkgname-$pkgver
  git clean -dfx
  ./configure --prefix=/usr --profile=stable
  LD_PRELOAD="" make || return 1
}

package() {
  
  cd ${srcdir}/${_pkgname}

  LD_PRELOAD="" make DESTDIR=$pkgdir install
  # delete conflicting files
  find $pkgdir/usr/share/mime/ -type f -exec rm {} \;

  # NuGet.exe is missing somehow, fixed FS#43423
   install -Dm755 "${srcdir}"/monodevelop/main/external/nuget-binary/NuGet.exe "${pkgdir}"/usr/lib/monodevelop/AddIns/MonoDevelop.PackageManagement/NuGet.exe
}

