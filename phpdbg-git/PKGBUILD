# Maintainer fzerorubigd <fzerorubigd@anywhere>

pkgname=phpdbg-git
pkgver=v0.3.2.r0.g891477d
pkgdesc='phpdbg aims to be a lightweight, powerful, easy to use debugging platform for PHP5.4+'
pkgrel=1
_pkgbase=php
_pkgbasever=5.5.8
arch=('i686' 'x86_64')
license=('PHP')
url='http://phpdbg.com/'
_gitname=phpdbg
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix' 'libvpx'
             'sqlite' 'unixodbc' 'net-snmp' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'libpng' 'libjpeg' 'icu'
             'curl' 'libxslt' 'openssl' 'bzip2' 'db' 'gmp' 'freetype2' 'systemd')
source=("http://www.php.net/distributions/${_pkgbase}-${_pkgbasever}.tar.gz"
        "http://www.php.net/distributions/${_pkgbase}-${_pkgbasever}.tar.gz.asc"
        "git+https://github.com/krakjoe/$_gitname.git")

md5sums=('1ed2b0193ecaca8b980a9b6a90357f1c'
         'SKIP'
         'SKIP'
         )

prepare() {
  cd $srcdir/$_gitname
  [ -d ${srcdir}/${_pkgbase}-${_pkgbasever}/sapi/$_gitname ] || mkdir ${srcdir}/${_pkgbase}-${_pkgbasever}/sapi/$_gitname
	GIT_WORK_TREE=${srcdir}/${_pkgbase}-${_pkgbasever}/sapi/$_gitname git checkout -f master

  cd ${srcdir}/${_pkgbase}-${_pkgbasever}/
}

build() {
  cd ${srcdir}/${_pkgbase}-${_pkgbasever}/
  ./buildconf --force
  ./configure
  make
}

package() {
  cd ${srcdir}/${_pkgbase}-${_pkgbasever}/
  make INSTALL_ROOT=$pkgdir install-phpdbg
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
