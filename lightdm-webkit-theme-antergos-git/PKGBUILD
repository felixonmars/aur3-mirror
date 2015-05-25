# Maintainer: Dustin Falgout <dustin@antergos.info>

pkgname=lightdm-webkit-theme-antergos-git
_gitname=lightdm-webkit-theme-antergos
_pkgname=antergos
pkgver=2.1.0.r9
_pkgver=2.1.0
_bgver=0.6
epoch=1
pkgrel=2
pkgdesc="The official greeter theme of Antergos Linux"
arch=('any')
url="http://www.antergos.com"
license=('GPLv2')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('git')
provides=('lightdm-webkit-theme-antergos')
conflicts=('lightdm-webkit-theme-antergos')
install=theme.install
source=("$pkgname"::'git+http://github.com/Antergos/lightdm-webkit-theme-antergos.git#branch=master'
        "http://antergos.org/antergos-wallpapers-${_bgver}.zip")
sha256sums=('SKIP'
            '383484231d5d4c1e785d8b5e7635909e3e3200a9fe18fef5dbc6fc2f23961b28')


pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}
build()
{
    cd "${srcdir}/${pkgname}"
    sed -i 's%/usr/share/%/usr/share/lightdm-webkit/themes/%g' index.html
}

package()
{
	cd "${pkgdir}"
	mkdir -p usr/share/lightdm-webkit/themes
	cd usr/share/lightdm-webkit/themes
	cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}" ${_pkgname}
	msg "Removing .git files"
	cd ${_pkgname}
	rm -f .gitignore
	rm -rf .git
	cp -dpr --no-preserve=ownership "${srcdir}/antergos-wallpapers-${_bgver}" wallpapers
}
