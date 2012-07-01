# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Alexander Fehr <pizzapunk gmail com>
# Contributor:  Philipp Giebel <arch@ambience-design.net>
# Contributor:  teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=keepassx-svn
_pkgname=keepassx
#_pkgname="${pkgname%-*}"
pkgver=386
pkgrel=2
pkgdesc="Cross platform password manager"
url="http://www.keepassx.org"
license=("GPL2")
arch=("i686" "x86_64")
depends=("qt" "libxtst")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-gcc47.patch")
md5sums=("04d5468efaae4502d3fa54729a1878d6")
sha1sums=("2ac994e14ab43e47f792edff151f7e8878078dff")

_svntrunk="https://${_pkgname}.svn.sourceforge.net/svnroot/${_pkgname}/trunk/"
_svnmod="${_pkgname}"

build() {
  cd "${srcdir}"

  #SVN {{{
  msg "Connecting to SVN server..."
  if [ -d "${_svnmod}" ]; then
    (cd "${_svnmod}" && svn update -r "385")
    msg "The local repository was updated."
  else
    svn co "${_svntrunk}" "${_svnmod}" -r "385"
  fi
  msg "SVN checkout done or server timeout."
  cd "${srcdir}"
  if [ -d "${_svnmod}-build" ]; then
    rm -rf "${_svnmod}-build"
  fi
  cp -rf "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build"
  #}}}

  cd "${srcdir}/${_pkgname}-build"

  #http://sourceforge.net/tracker/index.php?func=detail&aid=3519324&group_id=166631&atid=839779
  #http://pkgs.fedoraproject.org/gitweb/?p=keepassx.git;a=blob_plain;f=keepassx-0.4.3-gcc47.patch
  patch -uNp1 -i "${srcdir}/${pkgname}-gcc47.patch"

  qmake PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-build"

  make INSTALL_ROOT="${pkgdir}" install
}
