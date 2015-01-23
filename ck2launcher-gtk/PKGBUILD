# Maintainer: selaux <github@stefanlau.com>

_reponame=ck2launcher-gtk
_gitrev=04bc6b96fb27073bec1964379f3321bf1330b45e
_sourcefilename="ck2launcher.py"
_filename="ck2launcher-gtk"

pkgname=ck2launcher-gtk
pkgver=20150122
pkgrel=3
pkgdesc="GTK-based launcher for Crusader Kings 2, allowing to select Mods & DLC"
arch=('i686' 'x86_64')
url='https://github.com/selaux/ck2launcher-gtk'
license=('GPLv3')
makedepends=('tar')
depends=('python-gobject' 'python-appdirs')
source=("https://github.com/selaux/${_reponame}/archive/${_gitrev}.tar.gz")
sha512sums=('bb9d610a2236174542179dfc092a70502f8ded4d04cb5a2dde66b03bbd4c57eaf84c2ccae18a34450a8b2c4457da5339c97e010da19e68908f2861041879e6da')

package() {
  cd "$srcdir"
  install -Dm755 ${_reponame}-${_gitrev}/${_sourcefilename} ${pkgdir}/usr/bin/${_filename}
}
