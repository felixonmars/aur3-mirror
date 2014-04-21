# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-bin
pkgver=2.1.8
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2"), precompiled'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl_mixer' 'libpng12' 'srb2-data=2.1.7')
provides=("srb2")
conflicts=("srb2")
options=('!strip') # file is upx'd, will be crippled when stripped
source=(srb2.$CARCH::"http://alam.srb2.org/SRB2/$pkgver-Final/Linux/Release/lsdlsrb2"
        "srb2.bashcomp")
sha256sums=('940fe281f23d75054ab172bef81cccb31ae79db804d34c70bd55267bf047fe58'
            'e84d777fbed2acc50c36bbd93e4ad867877fb2bd31ee1af57e9b52f440a406f0')
if [ "$CARCH" == "x86_64" ]; then
  source[0]=srb2.$CARCH::"http://alam.srb2.org/SRB2/$pkgver-Final/Linux64/amd64/Release/lsdlsrb2"
  sha256sums[0]='821ff879b9cc34ddc86d7daef5bf671bfe6ae27c4fb2e6b8131c5ee68a16bb5f'
fi

package() {
  install -Dm755 srb2.$CARCH "$pkgdir"/usr/bin/srb2
  #install -Dm644 srb2.bashcomp "$pkgdir"/usr/share/bash-completion/completions/srb2
}
