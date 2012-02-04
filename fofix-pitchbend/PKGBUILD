# Maintainer: Hakim <acrox999 at gmail dot com>
pkgname=fofix-pitchbend
pkgver=20111113
pkgrel=1
pkgdesc="Pitchbend module for FoFiX"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fofix/"
license=('GPL')
groups=('game')
depends=('libsndobj-cvs' 'sdl_mixer')
makedepends=('git')
replaces=('fofix-pitchbend')
install=${pkgname}.install
#source=('build')
#md5sums=('55076f8c7b7688e6d4f419f99c12ec82')

_gitroot="git://git.jstump.com/git/pitchbend.git"
_gitname="pitchbend"

build() {
cd "${srcdir}"

msg "Cloning the GIT repo or pulling latest revision of 'pitchbend'..."
if [ -d $_gitname ] ; then
cd $_gitname && git pull origin
else
git clone $_gitroot $_gitname
fi

msg "Doing some housekeeping..."
rm -rf "${srcdir}/${_gitname}-build"
cp -r "$srcdir/${_gitname}" "$srcdir/${_gitname}-build"
cd "$srcdir/${_gitname}-build"
touch VERSION
cp -r "${srcdir}/${_gitname}-build" /tmp/pitchbend-build

msg "If you get an error such as 'SDL.h not found', please create a symlink for all header files for SDL. (e.g 'sudo ln -s /usr/include/SDL/* /usr/include/')"
msg "If you still received error after creating the symlink, please build the package manually in the source folder (src/pitchbend) folder by issuing the following command 'python2 setup.py build' and run this script again."
}