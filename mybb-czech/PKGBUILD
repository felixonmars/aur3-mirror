# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=mybb-czech
pkgver=1.4.00
pkgrel=1
pkgdesc='Czech language pack to the MyBB. It includes the translation as well as translated images.'
arch=('i686' 'x86_64')
url=('http://mybb.com/downloads/translations')
license=('GPL')
depends=('mybb')
makedepends=('unzip')
source=('lang_czech_1400.zip::http://mybb.com/download/90/zip')

build() {
  cd "$srcdir"
  _install_dir="${pkgdir}/srv/http/mybb"
  install -dm755 ${_install_dir}/{images,inc} || return 1

  #i18n
  cp -r images/* ${_install_dir}/images || return 1
  cp -r inc/* ${_install_dir}/inc || return 1

  #permission
  find ${_install_dir} -type f -exec chmod 0644 '{}' ';'
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('fdbc8ae8d33a61e3df61064a50198dcd')
