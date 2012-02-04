# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=mybb-chinese
pkgver=1.4.00
pkgrel=1
pkgdesc='Chinese language pack to the MyBB. It includes the translation as well as translated images.'
arch=('i686' 'x86_64')
url=('http://mybb.com/downloads/translations')
license=('GPL')
depends=('mybb')
makedepends=('unzip')
source=("lang_chinese_1400.zip::http://mybb.com/download/96/zip")

build() {
  cd "$srcdir"
  _install_dir="${pkgdir}/srv/http/mybb"
  install -dm755 ${_install_dir}/{images,inc} || return 1
  #install -dm755 ${_install_dir}/{admin,images,inc,install} || return 1

  #i18n
#  cp -r admin/* ${_install_dir}/admin || return 1
#  cp -r install/* ${_install_dir}/install || return 1
  cp -r images/* ${_install_dir}/images || return 1
  cp -r inc/* ${_install_dir}/inc || return 1

  #permission
  find ${_install_dir} -type f -exec chmod 0644 '{}' ';'
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('7b5a2889e3f8a535373cdc51f74cff3d')
