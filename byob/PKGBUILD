# Maintainer: Anatoly Kamchatnov <akamch at gmail dot com>
pkgname=byob
pkgver=3.1.1
pkgrel=1
pkgdesc="Build Your Own Blocks is a visual programming language based on Scratch."
arch=('i686' 'x86_64')
url="http://byob.berkeley.edu/"
license=('custom')
depends=('scratch')

source=('http://byob.berkeley.edu/BYOB_3_1_1_110519_w_changes.zip'
    'http://byob.berkeley.edu/byoblib.tgz'
    'http://byob.berkeley.edu/byob.debian')
md5sums=('5e357f439b03f39beab3a58f4e062ca5'
    '9d990558fe880d28960e7f631dd7d90a'
    'da41804df6b71cecabed59180847b521')

build() {
    cd $srcdir
    mkdir -p usr/{lib,share}/scratch

    unzip -q BYOB_3_1_1_110519_w_changes.zip -d usr/lib/scratch
    
    bsdtar xzf byoblib.tgz -C usr/share/scratch
    rm -rf usr/share/scratch/{Help,locale,README-SCRATCH.txt}

    mkdir -p usr/share/licenses/byob
    mv usr/share/scratch/license.txt usr/share/licenses/byob

    install -D byob.debian usr/bin/byob
    sed -i 's/-vm-sound-pulse/-vm-sound-ALSA/' usr/bin/byob

    cp -Rp usr/ $pkgdir
}

