# Contributor: Michael Witten <mfwitten>

# The various phases of the build can be controlled
# with the following variables (use an empty value
# to mean false):

_source=yes
_clean=yes
_compile=yes
_install=yes
#_install=          # do not install

# RECOMMENDED
# -----------
# Use a kind of symlink to point firefox to the
# source repository rather than installing the
# files system-wide. This allows you to hack on
# the source without having to reinstall just
# to try out the results.

_install_pointer=

######################################################################

pkgname=greasemonkey-git
license=(MIT)
pkgver=1694.7c9a9e7
pkgver()
{
  cd "$srcdir/$_repo"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A user-script manager for Firefox."
arch=(any)
url=http://www.greasespot.net/
depends=('firefox>=3.0')
makedepends=(unzip)
provides=(greasemonkey)

_repo=repo

source=(
  ${_source:+"$_repo"::git+git://github.com/greasemonkey/greasemonkey.git}
)
md5sums=(
  ${_source:+SKIP}
)

build()
{
  #### Clean ####

    if [[ $_clean ]]; then

      cd "$srcdir/$_repo"

      msg "Cleaning ..."
      git clean -fdx

    fi

  #### Compile ####

    if [[ $_compile && ! $_install_pointer ]]; then
    
      cd "$srcdir/$_repo"

      msg "Compiling ..."
      sh build.sh

    fi
}

package()
{
  #### Install  ####

    if [[ ! $_install ]]; then
      return
    fi

    msg "Installing ..."
    
    cd "$srcdir/$_repo"
    
    # This isn't very safe over time; XML parsing should really be used
    local extension_id="`awk -F'<em:id>|</em:id>' '/<em:id>/ {print $2; exit}' install.rdf`"
    local path_install="$pkgdir/usr/lib/firefox/browser/extensions/$extension_id"

    if [[ $_install_pointer ]]; then
      install -d "$(dirname "$path_install")"
      echo "$(pwd)" > "$path_install"
    else
      install -d "$path_install"
      unzip -od "$path_install" *.xpi # it's probably bad to rely on globbing.
    fi
}
