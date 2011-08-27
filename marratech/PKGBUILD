# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
pkgname=marratech
pkgver=6.1
pkgrel=1
pkgdesc="Internet video conferencing, e-meeting and web conferencing"
arch=(i686 x86_64)
url="http://www.marratech.com"
license=('custom')
depends=('alsa-lib' 'gtk2' 'libxp' 'libxtst' 'libstdc++5' 'libxt')
makedepends=('rpmunpack')
source=(http://www.marratech.com/download/files/marratech61_linux/Marratech-$pkgver.i586.rpm
    marratech.profile)
md5sums=('d2212f9205597684c50273251ee7336c'
         'b475c0ac92e77f21ba01180b7a14ee04')

build() {
    cd $srcdir
    rpmunpack Marratech-6.1.i586.rpm
    gunzip < Marratech-6.1-956.cpio.gz | cpio -ivd
    mkdir opt
    mv ./usr/local/marratech/Marratech6.1 ./opt
    mkdir -p ./usr/share/licenses/marratech
    cp ./opt/Marratech6.1/end_user_license.html ./usr/share/licenses/marratech
    sed -i 's_/usr/local/marratech/Marratech6.1_/opt/Marratech6.1_' ./opt/Marratech6.1/bin/Marratech
    rm -rf ./usr/local
    mkdir -p ./etc/profile.d
    cp marratech.profile ./etc/profile.d/marratech.sh
    chmod +x ./etc/profile.d/marratech.sh
    cp -rf ./opt ./usr ./etc ../pkg
}
