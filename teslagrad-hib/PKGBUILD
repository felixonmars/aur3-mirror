#Maintainer: Faerbit <faerbit at gmail dot com>
pkgname=teslagrad-hib
pkgver=1394046266
_pkgver=1_2_2
pkgrel=1
pkgdesc="A hand-drawn 2D puzzle platformer game with magnets."
depends=("glu" "libxcursor" "mesa")
url="http://www.teslagrad.com/"
arch=('i686' 'x86_64')
license=('custom:commercial')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

if [[ $CARCH = "x86_64" ]]; then
    source=("hib://Teslagrad_linux64_${pkgver}.zip")
    md5sums=('d67296b6cbf6171097a0d86c96239ed2')
    sha1sums=('c50bc697e18c992a5b46b6169321af09f496aad6')
    sha256sums=('16e973022be4f427961aef41b686864d1f78951e10926ea39b5e11dc25837db6')
    sha384sums=('d94fc17ad1e8e63d263352b0c1cd9b9448a613597d495c676b7f7c85347a762b595342b165d451690c450012db92ead4')
    sha512sums=('d3ef9ff57388c0f37586baa24cee7c27532fec5759e64da338f94ef440480dcf473988a1f241123246ac6ffec56d7bae19a71c25e22eae741ee747a9c5e506b6')
    _arch="64"
elif [[ $CARCH = "i686" ]]; then
    source=("hib://Teslagrad_linux32_${pkgver}.zip")
    md5sums=('10887708a8235894c964a960d00ea919')
    sha1sums=('6220ac80fcff5d0edf11199843eda2679a5b701a')
    sha256sums=('206e1603eb8050800f3195559fcedf82b2deef28354d1549137533ab4d2be989')
    sha384sums=('7ad7ef0fa00c675f7715b87ee2d3494554a017b199e16244755b16c1ad9785c4a800544e61fd821d5e3c95293022a617')
    sha512sums=('a5929b860e4491e089a38041db6bc2e29e3426b818351720a10c3d0f89403c5d5b66581658bb498e3535e2ab9dd643cc3b9e8cde810d15db2d9b3e34e0a12d5b')
    _arch="32"
else
    echo "Cannot determine architecture."
    exit 1
fi

PKGEXT=".pkg.tar"

package() {
    mkdir -p "$pkgdir"/{opt,usr/{bin,share/applications}}
    mv "Teslagrad_linux${_arch}_fullversion_${_pkgver}" "$pkgdir"/opt/teslagrad
    chmod a+x "$pkgdir"/opt/teslagrad/Teslagrad
    echo '#!/bin/bash
cd /opt/teslagrad
./Teslagrad' > "$pkgdir"/usr/bin/teslagrad
    chmod a+x "$pkgdir"/usr/bin/teslagrad
    echo "[Desktop Entry]
Type=Application
Name=Teslagrad
GenericName=Teslagrad
Comment=$pkgdesc
Icon=/opt/teslagrad/Teslagrad_Data/Resources/UnityPlayer.png
Exec=/usr/bin/teslagrad
Categories=Game;
Path=/opt/teslagrad" > "$pkgdir"/usr/share/applications/teslagrad.desktop
}

