# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=python2-sniffy-git
_pkgname=sniffy
pkgver=r40.1a9c77f
pkgrel=1
pkgdesc="Sniff media hosting websites for Flash-free consumption."
arch=(any)
url="https://github.com/tlvince/sniffy"
license=('GPL')
# Using 'pypcap-svn' until standard package is fixed
depends=('python2' 'pypcap-svn' 'python2-libquvi-git')
makedepends=('git')
options=(!emptydirs)
install='sniffy.install'
source=("git://github.com/tlvince/sniffy.git"
    'sniffy.d'
    'sniffy.d.conf')
md5sums=('SKIP'
         '41a112af1c0d3e6e926b76bcd92e9f3d'
         '4ab9c9a1f21660d81b6da46e69ecff0e')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m755 "${srcdir}/${_pkgname}.d" "${pkgdir}/etc/rc.d/${_pkgname}"
  install -D -m664 "${srcdir}/${_pkgname}.d.conf" "${pkgdir}/etc/conf.d/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
