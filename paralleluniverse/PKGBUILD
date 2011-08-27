# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=paralleluniverse
_pkgname=vegastrike
pkgver=496
pkgrel=1
pkgdesc="A modification for Privateer Remake 1.2, which itself is a total conversion of a game named VegaStrike."
arch=('i686' 'x86_64')
url="http://pu.wcjunction.com/"
license=('GPL')
depends=('desktop-file-utils' 'vegastrike')
makedepends=('subversion')
optdepends=('vegastrike-svn: development version of the game binaries')
conflicts=('vegastrike-data' 'vegastrike-data-svn')
install=$pkgname.install

source=($pkgname.desktop)
md5sums=('0a648dcb895973d414eafbcf11b0771a')

_svntrunk=https://svn.wcjunction.com/priv_pu/trunk
_svnmod=trunk

build() {
  cd ${srcdir}

#data files
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod --username username --password password
  fi
  msg "Parallel Universe DATA SVN checkout done or server timeout"

#data files install
  install -d ${pkgdir}/usr/share
  cp -a ${srcdir}/trunk ${pkgdir}/usr/share/${_pkgname} || return 1

#install .desktop file and icon
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop || return 1
  install -D -m644 ${pkgdir}/usr/share/${_pkgname}/${_pkgname}.xpm \
    ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm || return 1

#removing junk
  rm -rf `find ${pkgdir}/usr/share -type d -name .svn` || return 1
  rm `find ${pkgdir}/usr/share -type f -name \*.bat` || return 1
  rm `find ${pkgdir}/usr/share -type f -name \*.exe` || return 1
}
