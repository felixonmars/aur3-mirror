# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=labrea
pkgver=2.5stable1
pkgrel=5
pkgdesc="Intrusion detection tool to detect and trap worms, hackers and other malware."
arch=('i686' 'x86_64')
url="http://labrea.sourceforge.net/"
license=('GPL')
depends=('libdnet' 'libpcap')
makedepends=('autoconf' 'automake' 'gcc' 'make' 'patch' 'pkg-config')
options=('!libtool')
backup=('etc/labrea.conf')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-2.5-stable-1.tar.gz \
	${pkgname}.conf.d \
	${pkgname}.logrotate.d \
	${pkgname}.rc.d \
	${pkgname}-incfix.diff)
md5sums=('e76d506e82b60cc5477ccee1b3368cda' 'a8138e1e0d4618f9bc5dcc0f29bf52ad' \
	 '03813267a5dd15486e2b743abce253c1' 'ac19bef7695106b75833ca643b7b4a26' \
	 '9db8e6ea1d5de046b86c038c73d14db9')

build() {
  cd ${srcdir}/${pkgname}-2.5-stable-1

  # fixes compile error on 32bit
  patch -Np1 -i ${startdir}/${pkgname}-incfix.diff || return 1

  # Generating build system
  sh autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-2.5-stable-1
  install -d ${pkgdir}/var/log ${pkgdir}/etc/{conf.d,logrotate.d,rc.d} || return 1

  make DESTDIR=${pkgdir} install || return 1

  # touch logs
  touch ${pkgdir}/var/log/labrea.log || return 1

  install -m644 ${startdir}/${pkgname}.conf.d ${pkgdir}/etc/conf.d/${pkgname} || return 1
  install -m644 ${startdir}/${pkgname}.logrotate.d ${pkgdir}/etc/logrotate.d/${pkgname} || return 1
  install -m755 ${startdir}/${pkgname}.rc.d ${pkgdir}/etc/rc.d/${pkgname} || return 1
}
