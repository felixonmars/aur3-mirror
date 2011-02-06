# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=mybb-urdu
pkgver=1.4.00
pkgrel=1
pkgdesc='Urdu language to the MyBB. It includes the translation as well as translated images.'
arch=('i686' 'x86_64')
url=('http://mybb.com/downloads/translations')
license=('GPL')
depends=('mybb')
makedepends=('unzip')
source=("lang_urdu_1400.zip::http://mybb.com/download/89/zip")

build() {
  cd "$srcdir"
  _install_dir="${pkgdir}/srv/http/mybb"
  install -dm755 ${_install_dir}/{images,inc/languages} || return 1

  #i18n
  cp -r images/* ${_install_dir}/images || return 1
  cp -r language/* ${_install_dir}/inc/languages || return 1

  #permission
  find ${_install_dir} -type f -exec chmod 0644 '{}' ';' || return 1

  rm -f ${_install_dir}/inc/languages/index.html || return 1
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('e18a28b4e81028aa37f110553d233e9b')
