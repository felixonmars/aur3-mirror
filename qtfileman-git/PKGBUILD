# Contributor: adriano <adriano.src@gmail.com>
# Contributor: Keshav P R <(skodabenz) (aatt) (rocketmail) (ddoott) (ccoomm)>

_pkgname="qtfileman"
pkgname="${_pkgname}-git"

pkgver=20110706
pkgrel=1
pkgdesc="Qt File Manager such as PCFileMan from LXDE but based on Qt4"
arch=('i686' 'x86_64')
url="http://gitorious.org/qtfileman"
license=('LGPL')
depends=('qt')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=()
md5sums=()
options=('strip')

_gitroot="git://gitorious.org/${_pkgname}/${_pkgname}.git"
_gitname="${_pkgname}"

_update_git() {

cd "${srcdir}"

msg "Connecting to GIT server...."

if [ -d "${srcdir}/${_gitname}/" ]
then
cd "${srcdir}/${_gitname}/"
git reset --hard
git fetch
git checkout master
git merge remotes/origin/master
msg "The local GIT repo has been updated."
else
git clone "${_gitroot}" "${_gitname}"
msg "GIT checkout done or server timeout"
fi
echo

}

build() {

_update_git

rm -rf "${srcdir}/${_gitname}_build" || true
cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"

cd "${srcdir}/${_gitname}_build"

msg "Starting make..."

qmake qtfileman.pro
echo
CFLAGS="" make
echo

}

package() {

cd "${srcdir}/${_gitname}_build"

install -d "${pkgdir}/usr/bin"
install -D -m755 "${srcdir}/${_gitname}_build/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

}
