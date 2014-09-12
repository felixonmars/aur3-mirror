# Maintainer: Saeed Rasooli <saeed.gnu at gmail dot com>

pkgname=starcal-git
pkgver=20140912
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url=(http://starcal.sourceforge.net)
license=('GPLv3')
depends=('python2>=2.6' 'pygtk>=2.8' 'pygobject' 'python2-pytz')
optdepends=('python2-igraph' 'python2-gflags' 'python2-httplib2' 'python2-gnomevfs')
makedepends=('git')
conflicts=('starcal2')
_gitroot='git://github.com/ilius/starcal.git'
_gitname='starcal'

build() {
    cd $srcdir

    msg "Clone the source from git...."
    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && \
        git pull origin && \
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi
    msg "GIT checkout done or server timeout"
}

package() {
    msg "Building package..."

    "$srcdir/${_gitname}/install" "$pkgdir" --for-pkg
}
