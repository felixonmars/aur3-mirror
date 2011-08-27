# Contributor: Apkawa <apkawa@gmail.com>

pkgname=south-docs-hg
pkgver=788
pkgrel=1
pkgdesc="Documentation for south, an intelligent schema migrations for Django applications"
arch=('any')
url="http://south.aeracode.org/browser"
license=('Apache')
makedepends=('mercurial' 'python-sphinx')
groups=(django-plugins)

_hgroot=http://bitbucket.org/andrewgodwin/
_hgrepo=south
_hgdocs=${pkgname}

build() {
    cd $srcdir
    if [ -d ${_hgrepo}/.hg ]; then
	cd ${_hgrepo}
	hg pull
	hg update -C --rev ${pkgver}
    else
	hg clone ${_hgroot} ${_hgrepo} --rev ${pkgver} || return 1
    fi


    msg "Mercurial clone done or server timeout"
    cp -r ${_hgrepo}/docs  ${_hgdocs}-build
    sphinx-build ${_hgdocs}-build $_hgdocs
    mkdir ${pkgdir}/usr/share/doc/ -p
    mv ${_hgdocs}/  ${pkgdir}/usr/share/doc/${_hgdocs}/
    rm -rf ${srcdir}/${_hgdocs}-build
}
