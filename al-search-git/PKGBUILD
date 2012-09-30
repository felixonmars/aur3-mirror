pkgname=al-search-git
pkgver=20120930
pkgrel=1
pkgdesc="A desktop search toolkit(P.R.China)"
arch=('any')
license=('BSD')
depends=('bash' 'zenity')
makedepends=('git')
backup=('etc/al-search.conf')
url='https://github.com/910JQK/al-search'
_gitroot="git://github.com/910JQK/al-search.git"
_gitname="al-search"
build()
{
    cd ${srcdir}
    msg "Connecting to GIT server...."
        git clone ${_gitroot} ${_gitname}
        msg "GIT checkout done or server timeout"
    rm -rf "$srcdir/${_gitname}-build"
    cp -r "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"

}
package()
{
    cd "$srcdir/${_gitname}-build"
    cp -rPp ./usr ../../pkg/
    cp -rPp ./etc ../../pkg/
}
