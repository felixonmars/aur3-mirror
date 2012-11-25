# Contributor: Tianjiao Yin <ytj000@gmail.com>
lang=zh
pkgname=mysql-doc-${lang}
pkgver=5.1
pkgrel=3
pkgdesc="Set of HTML chinese documentation for MySQL"
arch=('any')
url="http://dev.mysql.com/doc/"
license=('GPL')
options=('docs')
source=("http://downloads.mysql.com/docs/refman-${pkgver}-${lang}.html-chapter.tar.gz")
md5sums=('6d06387ff721cc9dd79e2f4f2f604639')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/doc/mysql
  mv refman-${pkgver}-${lang}.html-chapter ${pkgdir}/usr/share/doc/mysql/${lang}
}
