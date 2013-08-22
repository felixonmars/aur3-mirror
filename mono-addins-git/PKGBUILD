# Maintainer: Bence Horvath <horvathb@me.com>

pkgname=mono-addins-git
_pkgname=mono-addins
pkgver=20130809
pkgrel=1
pkgdesc="A generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('any')
url="http://www.mono-project.com/Mono.Addins"
license=('custom:MIT')
depends=('gtk-sharp-2>=2.12.8' 'mono>=2.10.5')
makedepends=('pkg-config' 'git')
provides=("mono-addins=${pkgver}")
conflicts=('mono-addins')
source=("${_pkgname}::git+https://github.com/mono/mono-addins.git")
sha512sums=('SKIP')

pkgver()
{
    cd ${srcdir}/${_pkgname}
	git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() 
{	
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr --enable-gui
	
    make
    
}

package()
{
    cd "${srcdir}/${_pkgname}"
    make GACUTIL="/usr/bin/gacutil -root ${pkgdir}/usr/lib" DESTDIR=${pkgdir} install

    install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}
