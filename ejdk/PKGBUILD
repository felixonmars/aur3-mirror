# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=ejdk
_major=8
_minor=33
pkgver=${_major}u${_minor}
_build="05"
_ver="1.$_major.0_$_minor"
_file=ejdk-$pkgver-fcs-linux-armv6-vfp-hflt.tar.gz
pkgrel=1
pkgdesc="Oracle Java SE Embedded Development Kit"
arch=('armv6h' 'armv7h')
url=http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html
license=('custom')
replaces=('ejdk-vfp-hardfp')
depends=('java-runtime-common' 'libxrender' 'libxtst' 'xdg-utils')
optdepends=('alsa-lib: sound'
            'ttf-dejavu: fonts')
provides=("java-runtime=$_major")

msg "Download manually $_file:"
msg "http://download.oracle.com/otn/java/ejdk/$pkgver-b$_build/$_file"
msg "And put on this folder: $PWD"

source=("http://download.oracle.com/otn/java/ejdk/$pkgver-b$_build/$_file")
md5sums=('61d52ea7bad9b10bd4c412a8a2b4d0fa')

package() {
    cd ejdk${_ver}/linux_armv6_vfp_hflt/jre

    mkdir -p $pkgdir/usr/lib/jvm/java-$_major-$pkgname/jre
    mkdir -p $pkgdir/usr/share/licenses/ejdk

    cp COPYRIGHT *.txt $pkgdir/usr/share/licenses/ejdk
    cp -R * $pkgdir/usr/lib/jvm/java-$_major-$pkgname/jre
}
