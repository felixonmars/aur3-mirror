# Original Author: oklai
# Maintainer: JokerYu <dayushinn@gmail.com>
pkgname=koala
pkgver=2.0.4
pkgrel=1
pkgdesc="A GUI application for Less, Sass, Compass and CoffeeScript compilation."
arch=("i686" "x86_64")
url="http://koala-app.com/"
license=("Apache")
depends=("gconf" "gtk2" "nss")
optdepends=(
  "ruby: sass compilation support" 
  "nodejs-less: use system less compiler"
  "ruby-sass: use system sass compiler" 
  "ruby-compass: use system compass compiler" 
  "coffee-script: use system coffee compiler"
)
makedepends=("nodejs" "node-webkit" "rubygems")
conflicts=("koala-deb")
options=(!strip)

# option to build binary, true or false
_buildBinary=false

# rubygems mirror
_gem_mirror="http://rubygems.org/downloads/"
# "https://ruby.taobao.org/gems/"
# "http://gems.rubyforge.org/gems/"

# rubygems version
_sass=3.4.9
_compass=1.0.1
_compass_core=1.0.1
_compass_import_once=1.0.5
_chunky_png=1.2.7
_ffi=1.9.6
_fssm=0.2.9
_multi_json=1.10.1
_rake=0.9.2.2
_rb_fsevent=0.9.4
_rb_inotify=0.9.5
_rdoc=3.9.4

source=(
  "https://github.com/oklai/koala/archive/v${pkgver}.tar.gz"
  "${_gem_mirror}sass-${_sass}.gem"
  "${_gem_mirror}compass-${_compass}.gem"
  "${_gem_mirror}compass-core-${_compass_core}.gem"
  "${_gem_mirror}compass-import-once-${_compass_import_once}.gem"
  "${_gem_mirror}chunky_png-${_chunky_png}.gem"
  "${_gem_mirror}ffi-${_ffi}.gem"
  "${_gem_mirror}fssm-${_fssm}.gem"
  "${_gem_mirror}multi_json-${_multi_json}.gem"
  "${_gem_mirror}rake-${_rake}.gem"
  "${_gem_mirror}rb-fsevent-${_rb_fsevent}.gem"
  "${_gem_mirror}rb-inotify-${_rb_inotify}.gem"
  "${_gem_mirror}rdoc-${_rdoc}.gem"
  "koala.png" 
  "koala.desktop"
  "koala.sh"
)

noextract=(
  "sass-${_sass}.gem"
  "compass-${_compass}.gem"
  "compass-core-${_compass_core}.gem"
  "compass-import-once-${_compass_import_once}.gem"
  "chunky_png-${_chunky_png}.gem"
  "ffi-${_ffi}.gem"
  "fssm-${_fssm}.gem"
  "multi_json-${_multi_json}.gem"
  "rake-${_rake}.gem"
  "rb-fsevent-${_rb_fsevent}.gem"
  "rb-inotify-${_rb_inotify}.gem"
  "rdoc-${_rdoc}.gem"
)

md5sums=('0c2460fecde6b8c3ca97420c3602e1c4'
         'b50ec4877b2af7cb05c1535752e47e12'
         '5a19400d88b93f091d12ce178b43e8ca'
         'c6fdee615aafd1e6db66cf8e349bc95e'
         '2197cae9d2fa582007391f5ae60ad52b'
         '3b872b1054bd3f586413d9169237432f'
         '8606c263037322ae957e1959245841be'
         '50b711e6127d7bbcd11257fe177747ab'
         '2c7f05f155e936a9f95caa84b9e023c9'
         '28e731d5c59dd721d6387f80b25a2ba1'
         '47456c473a7e3e347c0d20ebda7bbad4'
         '865ed70ff9f90d5d23dc4ab906358650'
         '3d18214b5606e227dea2e6a149cc4075'
         'cde974f0b5bc366486ec0e1bd4c98ca3'
         '3a1698e629503c336e7b29b38ecbb3a1'
         '4be134fba62b77de9b05d969a619535f')

function buildBinary() {
  cd ${pkgname}-${pkgver}/src

  msg "preparing nw file"
  zip -r ../${pkgname}.nw *

  cd ../
  cat /usr/bin/nw ${pkgname}.nw > ${pkgname}
  msg "build done"
}

function installFiles() {
  install -Dm 644 ${srcdir}/koala.png ${pkgdir}/opt/${pkgname}/
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  if [[ $_buildBinary = true ]]; then
      ln -s ${pkgdir}/opt/${pkgname}/${pkgname}  ${pkgdir}/usr/bin/${pkgname}
      msg "copying node-webkit libraries"
      ln -s /usr/lib/node-webkit/{nw.pak,icudtl.dat} ${pkgdir}/opt/${pkgname}/
      # cp /usr/lib/node-webkit/{nw.pak,icudtl.dat} ${pkgdir}/opt/${pkgname}/
      install -Dm 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/opt/${pkgname}
  else
      install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
      cp -r ${srcdir}/${pkgname}-${pkgver}/src/* ${pkgdir}/opt/${pkgname}/
  fi
}

build() {
  cd ${pkgname}-${pkgver}/src
  msg "installing node modules"
  npm install clean-css coffee-script less uglify-js autoprefixer
}

package() {
  msg "making path"
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/bin

  msg "installing ruby gems"
  _gemdir="${srcdir}/${pkgname}-${pkgver}/src/rubygems"
  _gembin="${_gemdir}/bin"
  gem install --no-user-install --ignore-dependencies --no-ri --no-rdoc -i "${_gemdir}" -n "${_gembin}" \
    "sass-${_sass}.gem" \
    "compass-${_compass}.gem" \
    "compass-core-${_compass_core}.gem" \
    "compass-import-once-${_compass_import_once}.gem" \
    "chunky_png-${_chunky_png}.gem" \
    "ffi-${_ffi}.gem" \
    "fssm-${_fssm}.gem" \
    "multi_json-${_multi_json}.gem" \
    "rake-${_rake}.gem" \
    "rb-fsevent-${_rb_fsevent}.gem" \
    "rb-inotify-${_rb_inotify}.gem" \
    "rdoc-${_rdoc}.gem" \

  msg "cleaning empty rubygems dirs"
  rm -rf "${_gemdir}/build_info" "${_gemdir}/cache" "${_gemdir}/doc" "${_gemdir}/extensions"

  if [[ $_buildBinary = true ]]; then
    msg "building binary files"
    buildBinary
  else
    depends+=("node-webkit")
    msg "skip building binary files"
  fi

  msg "installing files"
  installFiles
}