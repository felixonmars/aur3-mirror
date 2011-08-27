# Contributor: Markus M. May <mmay AT javafreedom DOT org>
# this work is heavily based on the work done at
# http://scm.narf.ssji.net/archlinux-packages/browser/redmine
pkgname=redmine-mysql-git
pkgver=20091209
pkgrel=1
pkgdesc="Redmine is a flexible project management web application written using Ruby on Rails framework."
url="http://www.redmine.org"
arch=(any)
license=('GPL2')
depends=('ruby>=1.8.6' 'rails>=2.3.4' 'rake' 'mysql' 'ruby-mysql')
optdepends=('apache: a full featured webserver'
            'ruby-rmagick: to enable Gantt export to png image'
            'git: a distributed version control system'
            'passenger: Apache Module for Rails')
	
makedepends=('git')

conflicts=('redmine')

provides=('redmine')

options=(!strip !docs)
install=redmine.install

backup=('etc/conf.d/redmine' 
		'usr/lib/redmine/config/database.yml' 
		'usr/lib/redmine/config/email.yml')

source=('database.yml'
        'email.yml'
         'redmine.init'
         'redmine.conf'
         'httpd-redmine.conf')
		
md5sums=('17d3e23378691237ae7f5e3412e19aa0'
         '06312f351a2f5ae477fc2cd03ce5a776'
         '0a1cb233a8f67680f81cfd1b3e47c4f7'
         '43e5f27ed30abd1b8f3a69b9ec4ce3cb'
         '04d5e943e2fba44e55fd00afeb5cf392')

_gitroot="git://github.com/edavis10/redmine.git"
_gitname="redmine"

build() {
  _instdir=${pkgdir}/opt/${pkgname/-*/}
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p ${_instdir}
  cp -ra ${srcdir}/redmine/* ${_instdir}
  rm ${_instdir}/{files,log}/delete.me
  
  for FILE in ${_instdir}/public/*.example; do
    mv ${FILE} ${FILE/.example/}
  done

  install -m 0755 ${srcdir}/database.yml ${_instdir}/config/
  install -m 0755 ${srcdir}/email.yml ${_instdir}/config/
  install -m 0755 -D ${srcdir}/redmine.init ${pkgdir}/etc/rc.d/redmine
  install -m 0644 -D ${srcdir}/redmine.conf \
	${pkgdir}/etc/conf.d/redmine.conf

  install -m 0644 -D ${srcdir}/httpd-redmine.conf \
	${pkgdir}/etc/httpd/conf/extra/httpd-redmine.conf

}
