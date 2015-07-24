# Contributor: Alexander Ovsyannikov <ovsinc at ya.ru>
# Maintainer: Alexander Ovsyannikov <ovsinc at ya.ru>

pkgname=owncloud-git
pkgver=20140730
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="http://owncloud.org/"
license=('GPL')
depends=('php-gd' 'php-intl')
optdepends=('phpmyadmin: A PHP and hence web-based tool to administrate MySQL over the WWW'
            'php-curl: for using curl module for PHP'
            'php-apache: to use the Apache web server'
            'php-fpm: to use the nginx web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'mariadb: to use the MySQL database backend3'
            'smbclient: to mount SAMBA shares'
            'php-mcrypt'
            'php-imagick: file preview'
            'ffmpeg: file preview'
            'libreoffice-common: file preview')

install=owncloud.install
makedepends=('git' 'nodejs')
options=('!strip')
source=("$pkgname-core::git+https://github.com/owncloud/core"
	"$pkgname-3rdparty::git+https://github.com/owncloud/3rdparty"
	"$pkgname-apps::git+https://github.com/owncloud/apps"
	#"$pkgname-appframework::git+https://github.com/owncloud/appframework.git"
	"$pkgname-bookmarks::git+https://github.com/owncloud/bookmarks.git"
	"$pkgname-calendar::git+https://github.com/owncloud/calendar.git"
	"$pkgname-contacts::git+https://github.com/owncloud/contacts.git"
	"$pkgname-news::git+https://github.com/owncloud/news.git"
	"$pkgname-notes::git+https://github.com/owncloud/notes.git"
	"$pkgname-mail::git+https://github.com/owncloud/mail.git"
	"$pkgname-music::git+https://github.com/owncloud/music.git"
	"$pkgname-shorty::git+https://github.com/owncloud/shorty.git"
	"$pkgname-tasks::git+https://github.com/owncloud/tasks.git"
	"$pkgname-maps::git+https://github.com/owncloud/maps.git"
	"$pkgname-SMStorage::git+https://github.com/owncloud/SMStorage.git"
	"$pkgname-documents::git+https://github.com/owncloud/documents.git"
	"apache.conf_example"
        "nginx.conf_example")

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         #'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'c0112de94a7d9bdb7b5d1705a344db81'
         'f34462681cab4253fef8d505cf7a9c9f')

build() {
  cd "$srcdir"
  ln -s $pkgname-news news

  (pushd $pkgname-news && make)

  rm -rf */.git

  cp -a $pkgname-apps/* $pkgname-core/apps/
  cp -a $pkgname-3rdparty/* $pkgname-core/3rdparty/

  #for i in calendar contacts bookmarks notes news mail shorty appframework music tasks maps SMStorage documents; do
  for i in calendar contacts bookmarks notes news mail shorty music tasks maps SMStorage documents; do
    rm -rf $pkgname-core/apps/$i
    cp -a $pkgname-$i $pkgname-core/apps/$i
  done

  rm -rf $pkgname-core/{tests,autotest.sh,.git,*/.git}
  find $pkgname-core -type f -name .gitignore -exec rm -f '{}' \;
}

package() {
  cd "$srcdir"

  install -d  ${pkgdir}/usr/share/webapps/
  cp -a $pkgname-core  ${pkgdir}/usr/share/webapps/owncloud/
  chown -R http:http ${pkgdir}/usr/share/webapps/owncloud/{apps,config}

  install -Dm0644 $pkgname-core/README.md  ${pkgdir}/usr/share/doc/$pkgname/README.md
  rm -f ${pkgdir}/usr/share/webapps/owncloud/README.md

  # install .conf files
  install -d ${pkgdir}/usr/share/doc/owncloud/examples
  install -m 644 ${srcdir}/apache.conf_example  ${pkgdir}/usr/share/doc/owncloud/examples
  install -m 644 ${srcdir}/nginx.conf_example  ${pkgdir}/usr/share/doc/owncloud/examples
}
