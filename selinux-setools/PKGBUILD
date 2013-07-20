# Maintainer: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=selinux-setools
_origname=setools
pkgver=3.3.8
pkgrel=1
pkgdesc="SELinux SETools GUI and CLI tools and libraries for SELinux policy analysis"
groups=('selinux' 'selinux-extras')
arch=('i686' 'x86_64')
url="http://oss.tresys.com/projects/setools/"
license=('GPL' 'LGPL')
depends=('flex' 'bison' 'selinux-usr-libselinux>=2.0.87' 'selinux-usr-libsepol>=2.0.38' 'libxml2' 'sqlite3>=3.6.20' 'tcl>=8.4.9' 'tk>=8.4.9' 'libglade>=2.6.4' 'selinux-refpolicy-src')
optdepends=('glib2: needed to build graphical tools'
            'gtk2>=2.8: needed to build graphical tools'
            'bwidget>=1.8: needed to build graphical tools')
makedepends=('swig=2.0.4' 'python' 'java-environment' 'pkgconfig' 'autoconf>=2.60')
source=("http://oss.tresys.com/projects/${_origname}/chrome/site/dists/${_origname}-${pkgver}/${_origname}-${pkgver}.tar.bz2")
sha256sums=('44387ecc9a231ec536a937783440cd8960a72c51f14bffc1604b7525e341e999')

build() {
  cd "${srcdir}/${_origname}-${pkgver}"

  # Python 2 fix
  export PYTHON=/usr/bin/python2

  # Fix expected version of SWIG
  sed -i -e "s|AC_PROG_SWIG(1.3.28)|AC_PROG_SWIG(2.0.0)|g" configure.ac
  aclocal
  autoreconf -if
  automake
  #Arch uses rather nonstandard directory for policy sources
  ./configure \
    --enable-swig-python \
    --enable-swig-tcl \
    --with-default-policy=/etc/selinux/refpolicy/src/policy \
    --disable-bwidget-check \
    --disable-selinux-check \
    --prefix=/usr
  # work around issue with gcc 4.3 + gnu99 + swig-generated code:
  sed -i -e 's:$(CC):gcc -std=gnu89:' libseaudit/swig/python/Makefile
	# qpol build fails due to this
	sed -i -e '470d' libqpol/swig/java/Makefile

  make
}

package() {
  cd "${srcdir}/${_origname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
