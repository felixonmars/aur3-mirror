# Contributor: Martin Herndl <martin.herndl@gmail.com>

pkgname=cog-scrobbler-svn
pkgver=187
pkgrel=1
pkgdesc="CogScrobbler lets you scrobble vinyls, tapes and other analog/offline media."
arch=('i686' 'x86_64')
url="http://trac.ulfurinn.net/cog-scrobbler"
license=('GPL')
depends=('boost' 'qt')
conflicts=('cog-scrobbler')
provides=('cog-scrobbler')

source=()
md5sums=()

_svntrunk=https://svn.ulfurinn.net/cog-scrobbler/trunk/
_svnmod=cog-scrobbler
_bin=cog_scrobbler

build() {
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod
  qmake
  make

  mkdir -p ${pkgdir}/usr/share/$_svnmod/
  mkdir -p ${pkgdir}/usr/share/applications/
  mkdir -p ${pkgdir}/usr/bin/
  cp $_bin ${pkgdir}/usr/share/$_svnmod/
  cp res/extract.png ${pkgdir}/usr/share/$_svnmod/image.png
  ln -s /usr/share/$_svnmod/$_bin ${pkgdir}/usr/bin/$_bin
  echo "[Desktop Entry]" > $_svnmod.desktop
  echo "Version=0.92" >> $_svnmod.desktop
  echo "Encoding=UTF-8" >> $_svnmod.desktop
  echo "MultipleArgs=false" >> $_svnmod.desktop
  echo "Terminal=0" >> $_svnmod.desktop
  echo "Icon=/usr/share/$_svnmod/image.png" >> $_svnmod.desktop
  echo "Exec=/usr/share/$_svnmod/$_bin" >> $_svnmod.desktop
  echo "Categories=Application;AudioVideo;" >> $_svnmod.desktop
  echo "Type=Application" >> $_svnmod.desktop
  echo "Name=CogScrobbler" >> $_svnmod.desktop
  cp ./$_svnmod.desktop ${pkgdir}/usr/share/applications/
}
