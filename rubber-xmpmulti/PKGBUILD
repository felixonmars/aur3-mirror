# Maintainer: Nicolas Estibals <Nicolas.Estibals@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Baptiste Grenier <baptiste@bapt.name>

pkgname=rubber-xmpmulti
_pkgname=rubber
pkgver=1.1
pkgrel=2
pkgdesc="A wrapper for LaTeX and friends with a patch from J. Detrey for \\multiinclude support"
arch=('any')
url="http://iml.univ-mrs.fr/~beffara/soft/rubber/"
provides=('rubber')
conflicts=('rubber')
license=('GPL')
depends=('python2')
makedepends=('texinfo')
source=("http://launchpad.net/rubber/trunk/$pkgver/+download/rubber-$pkgver.tar.gz"
	"rubber-1.1-spaces.patch::http://live.gnome.org/Gedit/LaTeXPlugin/FAQ?action=AttachFile&do=get&target=rubber-1.1-spaces.patch"
	"md5tohashlib.patch"
	"xmpmulti.patch"
	"xmpmulti.py"
	"rubberinfo--into.patch")
md5sums=('8087cdb498f51f91c2427c7d0b253189'
	'743f644122ba27c783748ac33510e4e8'
	'5478bafce24f09501d8c8d6075492a77'
	'7214f1d46794115f3b7e1009fecc50cf'
	'ac883200de25146843a133f361d4628e'
	'c4a57e6a9fa14d7139de5e3a497fec0b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -N -i "${srcdir}/rubber-1.1-spaces.patch" "${srcdir}/${_pkgname}-${pkgver}/src/rules/latex/__init__.py"
  patch -N -i "${srcdir}/md5tohashlib.patch" "${srcdir}/${_pkgname}-${pkgver}/src/util.py"
  patch -N -i "${srcdir}/xmpmulti.patch" "${srcdir}/${_pkgname}-${pkgver}/src/rules/latex/__init__.py"
  mv "${srcdir}/xmpmulti.py" "${srcdir}/${_pkgname}-${pkgver}/src/rules/latex/"
  patch -N -i "${srcdir}/rubberinfo--into.patch" "${srcdir}/${_pkgname}-${pkgver}/src/cmd_info.py"
  ./configure --prefix=/usr --mandir="${pkgdir}/usr/share/man" --infodir="${pkgdir}/usr/share/info"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" install
  mkdir -p $pkgdir/etc/bash_completion.d/
  echo "complete -f -X '!*.tex' rubber" > $pkgdir/etc/bash_completion.d/rubber
}
