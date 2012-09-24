pkgname=xsunpinyin-git
pkgver=20120924
pkgrel=1
pkgdesc='The SunPinYin Engine for XIM. SunPinYin is a Statistical Language Model based pinyin IME by Sun.'
arch=('i686' 'x86_64')
url='http://sunpinyin.googlecode.com'
license=('LGPL')
depends=('gtk2' 'sunpinyin-git' 'xproto')
makedepends=('scons')
conflicts=('xsunpinyin')
source=()
md5sums=()

_gitroot="git://github.com/sunpinyin/sunpinyin.git"
_gitname="sunpinyin"

build() {
    cd "$srcdir"

    if [[ -d $srcdir/$_gitname ]] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    cd "$srcdir/$_gitname/wrapper/xim"
    scons --prefix=/usr
}

package () {
    cd "$srcdir/$_gitname/wrapper/xim"
    scons install --prefix=/usr --install-sandbox=$pkgdir
}
