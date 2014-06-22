# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Maintainer: Andreas Baumann <abaumann at yahoo dot com>
pkgname=wolframe-git
pkgver=20130621
pkgrel=1
pkgdesc="A flexible client-server ecosystem for business applications."
license=('GPL3')
arch=('i686' 'x86_64')
url="http://wolframe.net/"
depends=('boost>=1.48' 'boost-libs>=1.48' 'openssl' 'pam' 'libsasl' 
         'sqlite3' 'postgresql-libs' 'libxml2' 'libxslt'
         'python')
makedepends=('git' 'docbook-xsl' 'doxygen' 'fop' 'graphviz' 'dia')
checkdepends=('expect' 'inetutils' 'diffutils')
backup=('etc/wolframe/wolframe.conf')
install='wolframe.install' 
source=(
  'wolframe.conf'
  'wolframed.service'
)
md5sums=('faa0c7a37d5d6156fe3d8e9f16093a06'
         'cc146a28908aad55f156860340934095')
_gitroot=git://github.com/mbarbos/Wolframe.git
_gitname=Wolframe

package() {
  cd ${srcdir}/$_gitname-build

  msg "Installing.."
  make \
    WITH_SSL=1 WITH_EXPECT=1 WITH_PAM=1 WITH_SASL=1 \
    WITH_SYSTEM_SQLITE3=1 WITH_PGSQL=1 WITH_LUA=1 WITH_LIBXML2=1 \
    WITH_LIBXSLT=1 WITH_LOCAL_LIBHPDF=1 WITH_ICU=1 \
    WITH_LOCAL_FREEIMAGE=1 WITH_PYTHON=1 WITH_CJSON=1 \
    WITH_TEXTWOLF=1 RELEASE=1 \
    DESTDIR=${pkgdir} prefix=/usr sbindir=/usr/bin \
    sysconfdir=/etc \
    install

  install -D -m644 ${srcdir}/wolframe.conf \
    ${pkgdir}/etc/wolframe/wolframe.conf
  install -D -m644 ${srcdir}/wolframed.service \
    ${pkgdir}/usr/lib/systemd/system/wolframed.service
  install -d -m775 -g nobody -o nobody \
    ${pkgdir}/var/log/wolframe
}

check() {
  cd ${srcdir}/$_gitname-build

  msg "Testing..."
  make test \
    WITH_SSL=1 WITH_EXPECT=1 WITH_PAM=1 WITH_SASL=1 \
    WITH_SYSTEM_SQLITE3=1 WITH_PGSQL=1 WITH_LUA=1 WITH_LIBXML2=1 \
    WITH_LIBXSLT=1 WITH_LOCAL_LIBHPDF=1 WITH_ICU=1 \
    WITH_LOCAL_FREEIMAGE=1 WITH_PYTHON=1 WITH_CJSON=1 \
    WITH_TEXTWOLF=1 RELEASE=1 \
    DEFAULT_MODULE_LOAD_DIR=/usr/lib/wolframe/modules \
    CFLAGS='-O2' CXXFLAGS='-O2' \
    LDFLAGS=-Wl,-rpath=/usr/lib/wolframe,-rpath=/usr/lib/wolframe/plugins
}

build() {
  cd ${srcdir}
  
  msg "Getting source from git..."
  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

  msg "Generating dependencies..."
  make depend \
    WITH_SSL=1 WITH_EXPECT=1 WITH_PAM=1 WITH_SASL=1 \
    WITH_SYSTEM_SQLITE3=1 WITH_PGSQL=1 WITH_LUA=1 WITH_LIBXML2=1 \
    WITH_LIBXSLT=1 WITH_LOCAL_LIBHPDF=1 WITH_ICU=1 \
    WITH_LOCAL_FREEIMAGE=1 WITH_PYTHON=1 WITH_CJSON=1 \
    WITH_TEXTWOLF=1 RELEASE=1 \
    DEFAULT_MODULE_LOAD_DIR=/usr/lib/wolframe/modules \
    CFLAGS='-O2' CXXFLAGS='-O2' \
    LDFLAGS=-Wl,-rpath=/usr/lib/wolframe,-rpath=/usr/lib/wolframe/plugins

  msg "Building..."
  make \
    WITH_SSL=1 WITH_EXPECT=1 WITH_PAM=1 WITH_SASL=1 \
    WITH_SYSTEM_SQLITE3=1 WITH_PGSQL=1 WITH_LUA=1 WITH_LIBXML2=1 \
    WITH_LIBXSLT=1 WITH_LOCAL_LIBHPDF=1 WITH_ICU=1 \
    WITH_LOCAL_FREEIMAGE=1 WITH_PYTHON=1 WITH_CJSON=1 \
    WITH_TEXTWOLF=1 RELEASE=1 \
    DEFAULT_MODULE_LOAD_DIR=/usr/lib/wolframe/modules \
    CFLAGS='-O2' CXXFLAGS='-O2' \
    LDFLAGS=-Wl,-rpath=/usr/lib/wolframe,-rpath=/usr/lib/wolframe/plugins

#  msg "Building documentation.."
#  cd docs
#  make doc
  cd ..
}
