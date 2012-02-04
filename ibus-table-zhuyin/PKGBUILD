# Contributor: Hiroshi Yui <hiroshiyui@gmail.com>

pkgname=ibus-table-zhuyin
pkgver=1.1.0
pkgrel=1
pkgdesc="ZhuYin (Bopomofo) input method for IBus table engine."
arch=('i686' 'x86_64')
url="https://github.com/definite/ibus-table-zhuyin"
license=('GPLv3')
depends=('ibus-table')
makedepends=('cmake')

build()
{
    cd ${srcdir}
    
    git clone git://github.com/definite/ibus-table-zhuyin.git ${pkgname}
    cd ${pkgname}
    cmake . -DCMAKE_INSTALL_PREFIX='/usr'
    make || return 1
    make DESTDIR="${pkgdir}/" install
}

