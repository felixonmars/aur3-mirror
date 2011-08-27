# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
pkgname=mybb-polish
pkgver=1.6.0
pkgrel=1
pkgdesc='Polish language to the MyBB. It includes the translation as well as translated images.'
arch=('i686' 'x86_64')
url=('http://mybb.com/downloads/translations')
license=('GPL')
depends=('mybb>=1.6.1')
source=(http://www.mybb.com/download/73/zip/lang_polish_1600.zip)

build() {
  cd "$srcdir"
  _install_dir="${pkgdir}/srv/http/mybb"
  install -dm755 ${_install_dir}/{images,inc} || return 1

  #i18n
  cp -r images/* ${_install_dir}/images || return 1
  cp -r inc/* ${_install_dir}/inc || return 1
  rm -f ${_install_dir}/inc/languages/index.html || return 1

  #permission
  find ${_install_dir} -type f -exec chmod 0644 '{}' ';' || return 1
}

# vim:set ts=2 sw=2 et ft=sh tw=100:
md5sums=('8e49799f78a295cd9f2a7f0535ea7a02')
