# Maintainer: Dávid Gábor Bodor <david.gabor.bodor@gmail.com>
# Contributor: Martti Kühne
pkgname=python3-pygame-svn
pkgver=3227
pkgrel=1
pkgdesc="Python game library. (SVN version)"
arch=('i686' 'x86_64')
url="http://www.pygame.org/"
license=('LGPL')
depends=('python' 'sdl_mixer' 'libvorbis' 'sdl_ttf' 'sdl_image' 'smpeg'
         'portmidi')
makedepends=('svn')
conflicts=('python3-pygame')
provides=('python3-pygame')

source=()
md5sums=()

_pythonver=$(python --version 2>&1 | awk '{ print(substr($2,0,3)); }')

_svntrunk=svn://seul.org/svn/pygame/trunk
_svnmod=pygame

build() {
    cd "${srcdir}"
    msg "Connecting to SVN server..."
    msg "Checking out $_svnmod"

    if [ -d "$_svnmod/.svn" ]; then
        (cd "$_svnmod" && svn up -r $pkgver)
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
    msg "Setting up build environment..."

    rm -rf "${srcdir}/$_svnmod-build"
    cp -r "${_svnmod}" "${_svnmod}-build" || return 1
    cd "${_svnmod}-build"

    msg "Starting build"
    python3 config.py
}

package() {
    cd "${srcdir}/${_svnmod}-build"
    python3 setup.py install --root="${pkgdir}" --prefix=/usr

    # Copying the examples and tests
    cp -R examples lib/* "${pkgdir}/usr/lib/python${_pythonver}/site-packages/pygame"
    cp -R test/* "${pkgdir}/usr/lib/python${_pythonver}/site-packages/pygame/tests"

    # Fixing permissions
    chmod 644 "${pkgdir}"/usr/include/python3.3m/pygame/*

    # Cleaning up package directory
    rm -rf `find "$pkgdir" -type d -name ".svn"`
}
