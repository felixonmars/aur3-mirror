#Maintianer Guan 'kuno' Qing < neokuno AT gmail DOT com>

pkgname=vim-caravaggio-git
pkgver=20100401
pkgrel=2
pkgdesc='A Gvim color theme named after the great baroque painter, Michelangelo Merisi da Caravaggio, git version. \
You can find screenshot at http://www.flickr.com/photos/10943014@N00/4483378333/'
arch=(i686 x86_64)
url='http://github.com/kuno/zib/blob/master/vim/caravaggio/'
license=('GPL')
depends=(gvim)
groups=(vim-plugins)
source=('http://github.com/kuno/zib/raw/master/vim/caravaggio/caravaggio.vim')
md5sums=('6b75a7d78aa2a955c96993db4f26aea3')

build() {
    install -Dm755 ${srcdir}/caravaggio.vim ${pkgdir}/usr/share/vim/vim72/colors/caravaggio.vim || return 1
}


