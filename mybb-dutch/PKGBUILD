# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=mybb-dutch
pkgver=1.4.12a
pkgrel=1
pkgdesc='Dutch language to the MyBB. It includes the translation as well as translated images.'
arch=('i686' 'x86_64')
url=('http://mybb.com/downloads/translations')
license=('GPL')
depends=('mybb')
makedepends=('unzip')
source=("mybb_lang_dutch_1412a.zip::http://mybb.com/download/76/zip")

build() {
  cd "$srcdir"
  _install_dir="${pkgdir}/srv/http/mybb"
  install -dm755 ${_install_dir}/{images,inc} || return 1

  #i18n
  cp -r images/* ${_install_dir}/images || return 1
  cp -r dutch.php ${_install_dir}/inc/ || return 1
  install -dm755 ${_install_dir}/inc/languages/dutch || return 1
  cp -r dutch/* ${_install_dir}/inc/languages/dutch || return 1

  #permission
  find ${_install_dir} -type f -exec chmod 0644 '{}' ';'
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('935c117938342e5275ecd1f769a00030')
