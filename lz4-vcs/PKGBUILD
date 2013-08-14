# Maintainer: Michael Witten <mfwitten>

# This is the revision to check out (an empty value means the latest):

  #_revision=101
  _revision=

# The various phases of the build can be controlled
# with the following variables (use an empty value
# to mean false). If you're hacking on the source,
# I RECOMMEND skipping the _source and _clean phases
# after getting things set up, and then simply managing
# them by hand.

  _source=yes
  _clean=yes
  _compile=yes
  _install=yes
  #_install=          # do not install

# These are the parts that should be built and installed:

  _lz4_parts=(lz4c)
  #_lz4_parts=(lz4c lz4cs lz4c32 fuzzer fuzzer32 fullbench fullbench32)


######################################################################

pkgname=lz4-vcs
pkgver=101
pkgver() { svnversion "$srcdir/$_repo"; }
pkgrel=1
pkgdesc='SVN version of tools for LZ4, a very fast [de]compression algorithm'

arch=(i686 x86_64)
url=http://code.google.com/p/lz4/
license=(BSD)

provides=(lz4)
conflicts=(lz4)

makedepends=(
  svn
  make
  gcc
)

options=('!strip')

_repo=repo

source=(
  ${_source:+"$_repo"::svn+http://lz4.googlecode.com/svn/trunk/${_revision:+"#revision=$_revision"}}
)
md5sums=(
  ${_source:+SKIP}
)

prepare()
{
  #### Clean ####

    if [[ $_clean ]]; then

      msg "Cleaning ..."
      cd "$srcdir/$_repo"
      make clean

    fi
}

build()
{
  #### Compile ####

    if [[ $_compile ]]; then
    
      msg "Compiling ..."
      cd "$srcdir/$_repo"
      make "${_lz4_parts[@]}"

    fi
}

package()
{
  #### Install  ####

    if [[ $_install ]]; then
    
      msg "Installing ..."
      cd "$srcdir/$_repo"
      for p in "${_lz4_parts[@]}"; do
        install -D "$p" "$pkgdir/usr/bin/$p"
      done

    fi
}
