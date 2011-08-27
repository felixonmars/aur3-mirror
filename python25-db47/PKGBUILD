# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com>

pkgname=python25-db47
pkgver=2.5.2
pkgrel=5
_pybasever=2.5
pkgdesc="A high-level scripting language (legacy version 2.5 with db4.7 patch)"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org"
depends=('db' 'bzip2' 'gdbm' 'openssl>=0.9.8d' 'zlib')
makedepends=('tk>=8.5.0' 'sqlite3')
provides=('python25')
replaces=('python25')
source=(http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.bz2
	Python-2.4.4-gdbm-1.patch
	python-2.5.CVE-2007-4965-int-overflow.patch
	python-2.5.2-set_wakeup_fd4.patch
	Python-2.5.2-idlelib.patch
	python-2.5.2-db47.patch)
md5sums=('afb5451049eda91fbde10bd5a4b7fadc'
         '2b61e06365e9fb5f3af22d946efa8be6'
         '738bd5678c3a40dec7d5df9a1e427cbc'
         '57026b050d006c904ab7bc721a1429b2'
         'e6441e0b013ac64795221154e0495e10'
         '4cdc16664ba1a66ae6043c8a504a2ec5')

build() {
  cd ${startdir}/src/Python-${pkgver}
  patch -Np1 -i ${srcdir}/Python-2.4.4-gdbm-1.patch || return 1
  # fix http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4965
  patch -Np1 -i ${srcdir}/python-2.5.CVE-2007-4965-int-overflow.patch || return 1
  
  patch -Np1 -i ${srcdir}/python-2.5.2-set_wakeup_fd4.patch || return 1
  patch -Np0 -i ${srcdir}/Python-2.5.2-idlelib.patch || return 1
  patch -Np1 -i ${srcdir}/python-2.5.2-db47.patch || return 1

  ./configure --prefix=/usr --enable-shared --with-threads --enable-unicode

  make || return 1
  make DESTDIR=${pkgdir} altinstall
  #rm ${pkgdir}/usr/bin/python
  #rm ${pkgdir}/usr/bin/python-config

  # Rename all the scripts
  pushd $startdir/pkg/usr/bin
  mv idle idle2.5
  mv pydoc pydoc2.5
  mv smtpd.py smtpd2.5.py
  #mv $startdir/pkg/usr/share/man/man1/python.1 $startdir/pkg/usr/share/man/man1/python25.1
  popd

  # license
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
