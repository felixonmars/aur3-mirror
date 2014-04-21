# Maintainer: Aaron Kimmig <aaron.kimmig@student.hpi.uni-potsdam.de>
# Contributor: gothmog.todi

pkgname=pelican-themes-git
pkgrel=1
pkgver=448.daceecf
pkgdesc="A collection of themes for the Pelican static website generator, hosted and updated on GitHub"
arch=('any')
url="https://github.com/getpelican/pelican-themes"
license=('GPL' 'MIT' 'Apache' 'WTFPL')
depends=('pelican')
makedepends=('git')
source=('git+https://github.com/getpelican/pelican-themes.git')
sha256sums=('SKIP')

_gitname="pelican-themes"

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  git submodule update --init --recursive
}

package() {
  cd ${_gitname}
  
  # get installation path
  pelican_themes_path="$(pelican-themes -p)"
  if [[ $? != 0 ]] ; then
    echo "pelican-themes -p exited with error code $?"
    echo "try reinstalling pelican and it's dependencies"
    exit 1
  fi

  # Create installation directories
  install -d -m755 "${pkgdir}${pelican_themes_path}"

  # get WTFPL license
  curl http://www.wtfpl.net/txt/copying/ > WTFPL
  install -D -m644 WTFPL "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"

  # Install the themes
  cp -rf * "${pkgdir}${pelican_themes_path}"
} 
