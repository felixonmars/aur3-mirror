# Contributor: Mike Redd <mredd -at- zerotuezero dot com>
# Maintainer: Mike Redd <mredd -at- zerotuezero dot com>

pkgname=dropbox-uploader-bash
_pkgname=dropbox_uploader
pkgver=0.113.b805522
pkgrel=1
pkgdesc='The pkgbuild was written before Andrea Fabrizis used Git, another user started a git pkg. Dropbox Uploader is a BASH script which can be used to upload files to Dropbox an online file sharing  synchronization and backup service.'
arch=('i686' 'x86_64')
url="http://www.andreafabrizi.it/?dropbox_uploader"
license=('GPL')
depends=('bash' 'curl')
makedepends=('git')
provides=('dropbox-uploader')
conflicts=('dropbox-uploader-git')
install=
source=('git://github.com/andreafabrizi/Dropbox-Uploader.git')
md5sums=('SKIP')

pkgver() {
  cd Dropbox-Uploader
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
   cd Dropbox-Uploader
   sed 's|"./dropbox_uploader.sh"|`which dropbox_uploader`|' -i dropShell.sh
}

package() {
  cd Dropbox-Uploader
     install -d -m 755 ${pkgdir}/usr/bin
     install -Dm644 README.md ${pkgdir}/usr/share/${_pkgname}/README
     install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/${_pkgname}/ChangeLog.${_pkgname}
     install -m 755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
     install -m 755 dropShell.sh ${pkgdir}/usr/bin/dropShell
}

# vim:syntax=sh
