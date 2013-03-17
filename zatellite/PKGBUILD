# Maintainer: LHFB
# Contributor: LHFB <200_Ok@gmx.com>
pkgname=zatellite
pkgver=20130317
pkgrel=1
pkgdesc="Simple and minimalist email checker with GUI"
arch=('i686' 'x86_64')
url="https://github.com/zatellite/zatellite"
license=('GPL')
groups=('network')
depends=('shoes-git')
makedepends=('git')
conflicts=('ruby 2.0.0')
install=zatellite.install
source=("https://raw.github.com/zatellite/zatellite/master/zatellite.rb")
md5sums=('9743eeb2a6840aa376aad5e37879b650')

_gitroot="git://github.com/${pkgname}/${pkgname}.git"
_gitname="${pkgname}"

build() { 

cd "${srcdir}"
git clone --depth=1 "${_gitroot}" "${_gitname}" || return 1
cp -Rf "${pkgname}" /usr/share/"${pkgname}"
cd /usr/share/"${pkgname}"

msg "Installing gems..."
gem install bundler
bundle install

echo “#!/bin/bash” > /usr/share/"${pkgname}"/"${pkgname}"
echo "shoes /usr/share/${pkgname}/${pkgname}.rb &" >> /usr/share/"${pkgname}"/"${pkgname}"
ln -s /usr/share/"${pkgname}"/"${pkgname}" /usr/bin/"${pkgname}"

chmod -R 777 /usr/share/"${pkgname}"
chmod a+x /usr/bin/"${pkgname}"

}
