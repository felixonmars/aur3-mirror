# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>
pkgname="uanytun"
pkgver="0.3.3"
pkgrel=1
pkgdesc="tiny secure anycast tunneling protocol implementation for flexible and fault-tolerant VPNs"
arch=("i686" "x86_64")
url="http://www.anytun.org/"
license=('GPL3')
groups=()
depends=(openssl glibc)
#depends=(libgcrypt glibc)
makedepends=(make gcc)
provides=()
conflicts=()
replaces=()
backup=()
options=(docs zipman ccache distcc)
install=uanytun.install
source=("http://www.anytun.org/download/$pkgname-$pkgver.tar.gz" "examples.patch")
noextract=()
md5sums=('ca39dab02e91b0737e2b3f0839e74f6a'
         '6b99e9299fdf81ef647bf4fe958f8779')
         
build() {
  local sharedir="/usr/share/${pkgname}-${pkgver}-${pkgrel}"
  local docdir="/usr/share/doc/${pkgname}-${pkgver}-${pkgrel}"
  local examplesdir=${docdir}/etc-examples

  msg "Building Source ..."
  cd "${srcdir}/${pkgname}-${pkgver}/src" || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --use-ssl-crypto --examplesdir=${examplesdir} || return 1 # use libssl
  #./configure --prefix=/usr --sysconfdir=/etc --examplesdir=${examplesdir} || return 1 # use libgcrypt
  make || return 1

  #msg "Building Manpages ..."
  #make manpage || return 1

  msg "Tweaking example for Arch ..."
  patch -p0 -d ../etc/uanytun/ < ${srcdir}/examples.patch

  msg "Installing ${pkgname} ..."
  make install DESTDIR="${pkgdir}"
  mv ${pkgdir}/etc/init.d/ ${pkgdir}/etc/rc.d/
  install -Dm 644 ../README ${pkgdir}${docdir}/README
  install -Dm 644 ../ChangeLog ${pkgdir}${docdir}/ChangeLog
  install -Dm 644 ../AUTHORS ${pkgdir}${docdir}/AUTHORS
}
