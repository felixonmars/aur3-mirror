# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Elliott Seyler <emhs08@gmail.com>
# Contributor: Gazj < garyjames82 AT gmail DOT com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Git version of https://aur.archlinux.org/packages/dfhack (thanks emhs!)
#
# If the package does not compile for your more recent version of
# Dwarf Fortress, try replacing the first `source` array entry with:
#   "git://github.com/DFHack/dfhack.git#branch=develop"
#
# To disable `stonesense` in case of issues with compiling it, switch
# its build flag from "on" to "off" in build():
#   -DBUILD_STONESENSE=off \

pkgname=dfhack-git
pkgver=0.40.16.r1.0.ga6b5ffe
pkgrel=1
pkgdesc="A cross-platform library for accessing Dwarf Fortress memory"
arch=('i686' 'x86_64')
url="https://github.com/DFHack/dfhack"
license=('custom:zlib')
depends=(gcc-libs libx11 allegro perl-xml-libxml)
makedepends=(cmake git perl-xml-libxslt)
if [[ $CARCH == 'x86_64' ]]; then
  depends+=(lib32-allegro)
  makedepends+=(gcc-multilib perl-xml-libxml)
fi
conflicts=(dfhack dfhack-myne)
provides=(dfhack)
replaces=(stonesense-svn)
# Submodules are tweaked in prepare()
source=(
  "git://github.com/DFHack/dfhack.git"
  "git://github.com/DFHack/stonesense.git"
  "git://github.com/DFHack/isoworld.git"
  "git://github.com/DFHack/DF2MC.git"
  "git://github.com/DFHack/df-structures.git"
  "git://github.com/DFHack/clsocket.git"
  "dwarffortress-hacked"
  "dfhack-run"
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
         'cbdaa6d53b1bc3a08feb8f270316d20a'
	 '27faf557adbcaec4c070f8094e206924')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            '8d68139fb2cbb49a25999462974bff5c40ba23028c823fb666507fbc151ac52d'
	    'f11870300ccd8908733c8869f93ae48b22130ee338412ffcae6f8228875db747')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  git submodule init
  git config submodule.plugins/stonesense.url $srcdir/stonesense
  git config submodule.plugins/isoworld.url $srcdir/isoworld
  git config submodule.plugins/df2mc.url $srcdir/DF2MC
  git config submodule.library/xml.url $srcdir/df-structures
  git config submodule.depends/clsocket.url $srcdir/clsocket
  git submodule update
}

build() {
  cd "$srcdir/${pkgname%-*}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE:string=Release \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/dwarffortress \
    -DBUILD_STONESENSE=on \
    -DBUILD_LIBRARY=on \
    -DBUILD_PLUGINS=on \
    -DSTONESENSE_INTERNAL_SO=off \

  make
}

package() {
  cd "$srcdir/${pkgname%-*}/build"
  make install

  cd ..
  install -Dm755 "$srcdir/dwarffortress-hacked" \
                 "$pkgdir/usr/bin/dwarffortress-hacked"
  install -Dm755 "$srcdir/dfhack-run" \
                 "$pkgdir/usr/bin/dfhack-run"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dfhack/LICENSE"
}
