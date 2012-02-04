# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Christoph Berliner <caberliner@gmail.com>
pkgname=zams-git
pkgver=20111015
pkgrel=1
pkgdesc="zams is a multiple choice training application with focus on the german exams for medical students"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/zams/"
license=('GPLv3')
groups=()
depends=(qt mysql)
makedepends=('gcc' 'git')
optdepends=(zams-conv-git)
conflicts=('zams')
provides=('zams')

_gitroot="git://zams.git.sourceforge.net/gitroot/zams/zams"
_gitname="zams"

build() {
    FAIL=0
    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf ${srcdir}/build
    git clone ${srcdir}/${_gitname} ${srcdir}/build

    cd ${srcdir}/build/zams

    qmake
    make && make DESTDIR=${pkgdir} install; FAIL=$?
    cd ..
    rm -rf ${srcdir}/build
    return $FAIL

}
