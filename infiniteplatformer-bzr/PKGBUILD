##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=infiniteplatformer-bzr
pkgver=20110605
pkgrel=1
pkgdesc="A persistent 2D multiplayer platformer universe where you can create your own levels and items, chat, explore levels, and collect items made by other people."
url="http://infiniteplatformer.com/"
arch=("i686" "x86_64")
license=("GPL3")
makedepends=(
    'bzr'
)
depends=(
    'python2'
    'python-podsixnet-svn'
    'psyco27-svn'
)
source=(
    "infiniteplatformer-server.sh"
    "infiniteplatformer.sh"
)

md5sums=(
    "412a925ef868d0a5a2fd24d5eefbc774"
    "22812c9bace64bde424e9cd108fe376c"
)

_bzrroot="http://infiniteplatformer.com/dev"
_bzrname1="Infinite8BitPlatformer"
_bzrname2="PodSix"

build() {
    cd "${srcdir}"

    # Game itself
    if [ -d "${_bzrname1}" ]; then
        cd "${_bzrname1}"
        msg "Updating ${_bzrname1}..."
        bzr up
    else
        msg "Checking out ${_bzrname1}..."
        bzr co "${_bzrroot}/${_bzrname1}/"
        cd "${_bzrname1}"
    fi

# Provided by python-podsixnet-svn:
    # Networking library
    #bzr co http://infiniteplatformer.com/dev/PodSixNet/
    #cd PodSixNet
    #python setup.py develop # you will need to be root/admin to do this step
    #cd ..

    # PodSix utilities library
    if [ -d "${_bzrname2}" ]; then
        cd "${_bzrname2}"
        msg "Updating ${_bzrname2}..."
        bzr up
    else
        msg "Checking out ${_bzrname2}..."
        bzr co "${_bzrroot}/${_bzrname2}/"
        cd "${_bzrname2}"
    fi
}

package() {
    #cd "${srcdir}/${_bzrname1}"
    cd "${srcdir}"

    install -dm755 "${pkgdir}/opt/"
    install -Dm755 "infiniteplatformer-server.sh" "${pkgdir}/usr/bin/infiniteplatformer-server"
    install -Dm755 "infiniteplatformer.sh"        "${pkgdir}/usr/bin/infiniteplatformer"

    cp -a "${_bzrname1}" "${pkgdir}/opt/${_bzrname1}"
    find "${pkgdir}/opt/${_bzrname1}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${_bzrname1}" -type f -exec chmod 644 {} \;
}

# vim:ts=4:sw=4:et
