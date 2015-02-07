# Contributor: milomouse <vincent[at]fea.st>
# Contributor: syfe <fkfire@gmail.com>
 
_realname=xs
pkgname=${_realname}-git
pkgver=20100211
pkgrel=2
pkgdesc="A less bad shell, with functional programming"
arch=(i686 x86_64)
license=('custom') # Basically public domain
url="http://github.com/frytvm/XS"
depends=('glibc')
makedepends=('boost' 'gc')
conflicts=('${_realname}')
provides=('${pkgname}')
options=('!libtool')
 
_gitroot=git://github.com/frytvm/XS.git
_gitname=master
 
build() {
    cd ${srcdir}
    if [ -d XS ] ; then
      cd XS && git pull --rebase || return 1
    else
      git clone --depth 1 ${_gitroot} || return 1
      cd XS
    fi
	automake --add-missing
    autoreconf || return 1
    ./configure --prefix=/usr --enable-lisptrees || return 1
    make || return 1
}

package() {
    cd ${srcdir}/XS
    make DESTDIR="${pkgdir}" install || return 1

    mkdir -p ${pkgdir}/usr/share/{xs,licenses/xs} || return 1
    install -m644 COPYING "${pkgdir}/usr/share/licenses/xs/" || return 1
    install -m644 {CHANGES,README} "${pkgdir}/usr/share/xs/" || return 1
}

