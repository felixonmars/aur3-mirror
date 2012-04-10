#Maintainer: Jekyll wu <adaptee [at] gmail [dot] com>
#Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=chsdir
pkgver=20120328
pkgrel=1
pkgdesc="Bash completion, for pinyin support to 'cd'."
url="http://easyscripts.googlecode.com/"
arch=('i686' 'x86_64')
license="GPL"
depends=('python2')
source=("http://easyscripts.googlecode.com/files/${pkgname}_${pkgver}.tar.gz")

build() {
	/bin/true;
}

package() {
    cd "${srcdir}/bash-completion-pinyin/"
    sed 's/python/python2/' -i chsdir
    install -D -m 755 chsdir "${pkgdir}/usr/bin/chsdir"
    install -D -m 644 chs_completion \
            "${pkgdir}/etc/bash_completion.d/chs_completion"
}

md5sums=('a58d6c74b7979ee26b95c9a4a5416f63')
md5sums=('70e8f0258b96208fc05ab79a149da685')
