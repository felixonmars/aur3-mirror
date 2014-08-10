# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=ejdk-vfp-hardfp
pkgver=8u6
_build="23"
_ver="1.8.0_06"
pkgrel=1
pkgdesc="Java Embedded with VFP extension and hardFP enabled"
arch=('armv7h')
url=http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html
license=('custom')
depends=('libxrender' 'libxtst' 'xdg-utils')
optdepends=('alsa-lib: sound'
            'ttf-dejavu: fonts')
provides=("java-runtime=$pkgver" "java-environment=$pkgver")
conflicts=("java-runtime" "java-runtime-headless" "java-web-start")
install=ejdk.install

msg "Download manually $ejdk-$pkgver-fsc-b$_build-linux-arm-vfp-hflt-12_jun_2014.tar.gz:"
msg "http://download.oracle.com/otn/java/ejdk/$pkgver-b$_build/ejdk-$pkgver-fcs-b$_build-linux-arm-vfp-hflt-12_jun_2014.tar.gz"
msg "And put on this folder: $PWD"

source=("http://download.oracle.com/otn/java/ejdk/$pkgver-b$_build/ejdk-$pkgver-fcs-b$_build-linux-arm-vfp-hflt-12_jun_2014.tar.gz"
        'ejdk.install'
        'ejdk.sh')

md5sums=('77a6bfd33723ec517c2fea363b86748f'
         '357b8ef2c9a500346bf250fe227d9477'
         '45e26a062f9e9a17fa3a486afad43ec6')

package() {
    cd ejdk${_ver}/linux_arm_vfp_hflt/jre

    mkdir -p "$pkgdir"/{opt/java/ejdk,usr/share/licenses/ejdk,etc/profile.d}

    cp COPYRIGHT *.txt "$pkgdir"/usr/share/licenses/ejdk/
    cp -R * "$pkgdir"/opt/java/ejdk/

    install -m755 "$srcdir"/ejdk.sh "$pkgdir"/etc/profile.d/
}
