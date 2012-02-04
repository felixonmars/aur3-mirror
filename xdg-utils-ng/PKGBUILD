# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=xdg-utils-ng
_pkgname=xdg-utils
pkgver=1.1.0rc1
_pkgver=1.1.0-rc1
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks with Hatred's pathches."
arch=(any)
url="http://portland.freedesktop.org/"
depends=('sh')
license=(MIT)
source=(http://portland.freedesktop.org/download/$_pkgname-$_pkgver.tar.gz
        hatred-xdg-utils-ng-$pkgver.diff
        xdg-utils.rc
        ChangeLog)

optdepends=('perl-file-mimeinfo: for mimeopen tool'
            'mimeo: for mimeo tool')

provides=(${_pkgname})
conflicts=(${_pkgname})
replaces=(${_pkgname})

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  patch -p1 < ../hatred-xdg-utils-ng-$pkgver.diff

  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/" || return 1
  
  install -m755 -d "${pkgdir}/etc/xdg/${_pkgname}"
  install -m644 ../xdg-utils.rc "${pkgdir}/etc/xdg/${_pkgname}/" || return 1
}
md5sums=('fadf5e7a08e0526fc60dbe3e5b7ef8d6'
         '2ed04689a4f1523aada19b9261f6ddfd'
         '7763f1456a4266d540e34d18fc2ed1d1'
         '3007fdfaaace77fcf44f783d3740259e')
