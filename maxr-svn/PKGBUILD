# Maintainer: Daniel Riedemann <daniel.riedemann [at] googlemail [dot] com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=maxr-svn
pkgver=2709
pkgrel=1
pkgdesc="A remake of the old DOS game M.A.X."
arch=('i686' 'x86_64')
url="http://maxr.org"
license=('GPL')
depends=('sdl_mixer' 'sdl_net')
makedepends=('subversion' 'autoconf' 'automake')
provides=('maxr')
conflicts=('maxr')
source=(maxr-{16,32,128}.png maxr.desktop)
md5sums=('3139ae1692e6ec4a7ed4fcaf1849128a'
         '97827efe0d05b6d979140ebdc3552c95'
         '1e9a78422c52f216582186d59f3b3726'
         '5b4ce786caf79bbcf8fa726bb1821786')


_svntrunk=svn://maxr.org/MAX/trunk
_svnmod=maxr/src

_svntrunk2=svn://maxr.org/MAX/game
_svnmod2=maxr/data

build() {
  cd "${srcdir}"

  if [[ -d ${_svnmod}/.svn ]]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  if [[ -d ${_svnmod2}/.svn ]]; then
    (cd ${_svnmod2} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk2} --config-dir ./ -r ${pkgver} ${_svnmod2}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [[ -d "${srcdir}/maxr-build" ]] && rm -rf "${srcdir}/maxr-build"
  cp -r "${srcdir}/maxr" "${srcdir}/maxr-build"
  cd "${srcdir}/maxr-build"

  cp ./src/mk/linux/configure.ac ./
  cp ./src/mk/linux/Makefile.am ./
  cp ./src/mk/linux/buildinfo.sh ./
  cp ./src/mk/linux/src/Makefile.am ./src

  autoreconf --install
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}/" install

  for _svn in $(find ${pkgdir}/ -type d -name '.svn'); do
    rm -rf ${_svn}
  done

  for _i in 16 32 128; do
    install -D -m644 "${srcdir}"/maxr-${_i}.png \
        "${pkgdir}"/usr/share/icons/hicolor/${_i}x${_i}/apps/maxr.png
  done
  
  install -d -m755 "${pkgdir}"/usr/share/pixmaps

  ln -s ../icons/hicolor/128x128/apps/maxr.png \
      "${pkgdir}"/usr/share/pixmaps/maxr.png

  install -D -m644 "${srcdir}"/maxr.desktop \
      "${pkgdir}"/usr/share/applications/maxr.desktop
}
