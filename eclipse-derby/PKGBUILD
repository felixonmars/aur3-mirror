# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=eclipse-derby  
pkgver=10.8.2.2
pkgrel=1 
pkgdesc="Apache Derby plugin for Eclipse"
url="http://db.apache.org/derby/index.html"
arch=("any")
license=("Apache")
depends=("eclipse")
source=("http://websiterra.com/friends/apache/db/derby/db-derby-${pkgver}/derby_core_plugin_10.8.2.zip" \
  "http://websiterra.com/friends/apache/db/derby/db-derby-${pkgver}/derby_ui_doc_plugin_1.1.3.zip")
md5sums=('90155356aee23e1b5b8101c7b41fba95'
         '65b11973f60fd4d4a7c6d90e2ccff740')
build() {
  cd $srcdir
  local eclipsedir=${pkgdir}/usr/share/eclipse/
  install -d $eclipsedir
  cp -R plugins $eclipsedir
}
