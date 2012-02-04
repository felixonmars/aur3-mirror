# Contributor: fuzzix@gmail.com
# Based on beta branch build: http://aur.archlinux.org/packages.php?ID=17178

pkgname=sphinx-release
_pkgname=sphinx
pkgver=0.9.9
pkgrel=1
pkgdesc="Free open-source SQL full-text search engine (release branch)"
arch=(i686 x86_64)
url=http://www.sphinxsearch.com/
license=(GPL)
optdepends=(libmysqlclient postgresql)
source=("http://sphinxsearch.com/files/${_pkgname}-${pkgver}.tar.gz"
	sphinx.conf.d
	sphinx.rc.d)
md5sums=('7b9b618cb9b378f949bb1b91ddcc4f54'
         '48e3e1857919d26d5104a48caffb531b'
         'd886222593c6bba891fd3ce982c90c00')
provides=("sphinx")
conflicts=("sphinx")

build()
{
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --exec-prefix=/usr \
    --program-prefix="sphinx-" --localstatedir=/var/lib/sphinx --sysconfdir=/etc/sphinx \
    --enable-id64
  make
  make DESTDIR="${pkgdir}" install
  install -Dm755 "${srcdir}"/sphinx.rc.d "${pkgdir}"/etc/rc.d/sphinx
  install -Dm644 "${srcdir}"/sphinx.conf.d "${pkgdir}"/etc/conf.d/sphinx
}
