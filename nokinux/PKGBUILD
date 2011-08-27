# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=nokinux
pkgver=0.0.8.6
pkgrel=1
pkgdesc="A program which allows you to configure a connection or explore your Nokia phone."
arch=('any')
url="http://www.nokinux.it"
license=('GPL')
depends=('obexfs' 'tree' 'zenity' 'gksu' 'pcmanfm')
source=("http://launchpad.net/nokinux/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" 'run.sh.p')

build() {
  cd ${srcdir}/${pkgname}

  # install files
  install -d ${pkgdir}/usr/share/nokinux ${pkgdir}/usr/bin
  install -Dm644 src/splash.py data/splash-image.png ${pkgdir}/usr/share/nokinux || return 1
  cp -rf src/strings data/lang ${pkgdir}/usr/share/nokinux || return 1
  patch -p0 -i ${srcdir}/run.sh.p
  install -Dm755 src/run.sh ${pkgdir}/usr/bin/nokinux || return 1

  install -Dm644 data/nokinux.desktop ${pkgdir}/usr/share/applications/nokinux.desktop || return 1
  install -Dm644 data/nokinux.png ${pkgdir}/usr/share/pixmaps/nokinux.png || return 1

  # install languages
  msgfmt -o po/it.mo po/it.po
  install -Dm644 po/it.mo ${pkgdir}/usr/share/locale/it/LC_MESSAGES/nokinux.mo || return 1
}
md5sums=('247ed4a08c122ac1a47a6da7efa59fa4'
         'da26b5bb2ab6636c865ad6688e6c744c')
