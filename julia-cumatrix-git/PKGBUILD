# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=julia-cumatrix-git
pkgver=20130708
pkgrel=1
pkgdesc="A CUDA matrix library for the Julia language."
arch=('any')
url="https://github.com/pavanky/julia-CuMatrix"
depends=('nvidia-utils' 'nvidia' 'cuda-toolkit' 'julia-git')
provides=('julia-CuMatrix')
license=('custom')
_cudadir=/opt/cuda
_gitroot=git://github.com/stefan-k/julia-CuMatrix
_gitname=julia-CuMatrix
source=("${_gitname}".conf)
sha512sums=('35dd6b9376cef7d11ebf35e9d1802a12283917f0947bc54c0f5d59a324d612daa6ce1e046372e4ed51183e030befa9bd1d7496bc013843f7f27385ce53be2e79')
install="${_gitname}".install

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "${srcdir}"/"${_gitname}"
  make CUDADIR="${_cudadir}" -C cuplus clean
  make CUDADIR="${_cudadir}" -C cuplus all
}

package() {
  cd "${srcdir}"/julia-CuMatrix
  install -Dm 755 libcuplus.so "${pkgdir}"/usr/lib/"${_gitname}"/libcuplus.so
  install -dm 755 "${pkgdir}"/usr/share/"${_gitname}"
  install -m 644 LICENSE "${pkgdir}"/usr/share/"${_gitname}"/LICENSE  
  install -dm 755 "${pkgdir}"/etc/ld.so.conf.d
  install -m 755 "${startdir}"/"${_gitname}".conf "${pkgdir}"/etc/ld.so.conf.d/"${_gitname}".conf   
}

                



