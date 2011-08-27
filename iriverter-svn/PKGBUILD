# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=iriverter-svn
pkgver=172
pkgrel=1
pkgdesc="A cross-platform mencoder frontend converting videos for various multimedia players - SVN version"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/iriverter/"
license=('GPL')
depends=('desktop-file-utils' 'mplayer' 'openjdk6' 'swt')
makedepends=('apache-ant' 'subversion')
install=$pkgname.install

source=($pkgname.desktop \
        $pkgname.sh)
md5sums=('453bf4c7e11c8d0375bec8d13d0db096'
         '6ae4d4933cc1b4759fa2e984f9ccafc9')

_svntrunk=http://iriverter.thestaticvoid.com/svn/trunk
_svnmod=iriverter

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk  --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  ant || return 1

#installing files
  install -D -m755 ${srcdir}/$pkgname.sh \
    ${pkgdir}/usr/bin/$pkgname || return 1
  install -D -m644 ${srcdir}/iriverter/jar/iriverter.jar \
    ${pkgdir}/usr/lib/$pkgname/$pkgname.jar || return 1
  install -D -m644 ${srcdir}/iriverter/web/iriverter.gif \
    ${pkgdir}/usr/share/pixmaps/$pkgname.gif || return 1
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop || return 1
}
