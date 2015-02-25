# Maintainer: Austin < doorknob60 at gmail dot com >
# Contributor: kumyco <kumyco@kh.nu>
# Contributor: N30N <archlinux@alunamation.com>
 
pkgname=glc
pkgver=0.5.8
pkgrel=4
pkgdesc="An ALSA & OpenGL capture tool for Linux"
arch=("i686" "x86_64")
url="https://github.com/nullkey/glc"
install=glc.install
source=("Copyright"
"glc.tar.gz::https://github.com/nullkey/glc/tarball/stable"
"elfhacks.tar.gz::https://github.com/nullkey/elfhacks/tarball/stable"
"packetstream.tar.gz::https://github.com/nullkey/packetstream/tarball/stable"
"glc-support.tar.gz::https://github.com/nullkey/glc-support/tarball/master")
license=("custom")
depends=("libpng" "alsa-lib" "libgl" "libxxf86vm")
makedepends=("cmake" "mesa")
conflicts=("glc-git")
if [ "$CARCH" = x86_64 ]; then
optdepends=('lib32-glc: Support for 32-bit applications such as Wine')
fi
md5sums=('d706bd101063967583d3e4f98e0bf14a'
'e33b7c221077a5a9db16171c08aa70ea'
'fc172d88f30fcfb8acb5eff071fd6287'
'89083b4be8aa1bda0c808fefe9c1146a'
'cd59270aee6c31bbe40ea6a82805f079')
_mods=("elfhacks" "packetstream" "glc")
 
prepare() {
mv nullkey-glc-ab9c270 glc
mv nullkey-elfhacks-2fd0565 elfhacks
mv nullkey-packetstream-d9d720b packetstream
mv nullkey-glc-support-7f56290 support
ln -sf "$srcdir/elfhacks" "$srcdir/glc/elfhacks"
ln -sf "$srcdir/packetstream" "$srcdir/glc/packetstream"
ln -sf "$srcdir/support" "$srcdir/glc/support"
 
local mod
for mod in ${_mods[@]}; do
mkdir -p "$srcdir/$mod/build"
done
}
 
build() {
if [ $CARCH == "x86_64" ]; then
CFLAGS="$CFLAGS -m64"
fi
 
export CMAKE_INCLUDE_PATH="$srcdir/glc/elfhacks/src:$srcdir/glc/packetstream/src"
export CMAKE_LIBRARY_PATH="$srcdir/glc/elfhacks/build/src:$srcdir/glc/packetstream/build/src"
local mod
for mod in ${_mods[@]}; do
msg2 "Building $mod..."
cd "$srcdir/$mod/build"
cmake .. \
-DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
-DCMAKE_BUILD_TYPE:STRING="Release" \
-DCMAKE_C_FLAGS_RELEASE_RELEASE:STRING="${CFLAGS}" \
-DMLIBDIR="lib"
make
done
}
 
package() {
local mod
for mod in ${_mods[@]}; do
msg2 "Installing $mod to pkgdir..."
cd "$srcdir/$mod/build"
make install
done
 
install -dm755 "$pkgdir/usr/share/glc/scripts"
install -m755 "$srcdir/glc/scripts/capture.sh" "$pkgdir/usr/share/glc/scripts/capture.sh"
install -m755 "$srcdir/glc/scripts/play.sh" "$pkgdir/usr/share/glc/scripts/play.sh"
install -m755 "$srcdir/glc/scripts/encode.sh" "$pkgdir/usr/share/glc/scripts/encode.sh"
install -Dm644 "$srcdir/Copyright" "$pkgdir/usr/share/licenses/$pkgname/Copyright"
} 
