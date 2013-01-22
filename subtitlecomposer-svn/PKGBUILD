# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=subtitlecomposer-svn
pkgver=53
pkgrel=1
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/subcomposer"
license=('GPL')
depends=('kdelibs' 'gettext')
makedepends=('cmake' 'automoc4' 'svn')
optdepends=("mplayer: for MPlayer backend")
conflicts=('subtitlecomposer' 'subtitlecomposer-git')
provides=("subtitlecomposer")

_svnmod="subtitlecomposer"
_svntrunk=https://subcomposer.svn.sourceforge.net/svnroot/subcomposer/trunk/

build() {
  msg "Development of the subtitlecomposer is now happening on GitHub "
  msg "(https://github.com/maxrd2/subtitlecomposer). There might not "
  msg "be any further improvements if you continue to use this package. "
  msg "You are adwised to look for 'subtitlecomposer-git' package on AUR."
  msg ""
  msg "Do you wish to continue building this package? [y|N]"
  read  ans
  if [ "$ans" == "y" ]; then
     msg "OK, you have been noted. Continuing build..."
  else
     msg "New PKGBUILD is here: "
     msg "https://aur.archlinux.org/packages/subtitlecomposer-git/ "
     msg "Quiting..."
     exit 0
  fi

    cd "${srcdir}"

    if [ -d $_svnmod/.svn ]; then
         (cd $_svnmod && svn up -r ${pkgver})
    else
         svn co $_svntrunk --config-dir ./ -r ${pkgver} $_svnmod
    fi
    msg "SVN checkout done or server timeout"
    msg "Starting make..."
}

package() {
    cd "${srcdir}/$_svnmod"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
    make DESTDIR=${pkgdir} install
}

