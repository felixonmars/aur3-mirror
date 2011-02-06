#Maintainer: Sky_Walker <omarbotta@gnulinuxlibre.net>
# Contributor: Michael Witten <mfwitten>

# The various phases of the build can be controlled
# with the following variables (use an empty value
# to mean false):

_source=yes
_clean=yes
_config=yes
_compile=yes
_install=yes
#_install=          # do not install

######################################################################

pkgname=icecat-greasemonkey-git
license=(MIT)
pkgver=HEAD
pkgrel=1
pkgdesc="A user-script manager for GNU IceCat."
arch=(i686 x86_64)
url=http://www.greasespot.net/
depends=('icecat>=3.0')
provides=(greasemonkey)

_gitroot=git://github.com/greasemonkey/greasemonkey.git
_gitname=repo

build()
{

  #### Source ####

    cd "$srcdir"                                         || return 1

    if [ ! $_source ]; then

      cd "$srcdir/$_gitname"                             || return 1

    else

      msg "Connecting to GIT server...."

      if [ -d "$_gitname" ] ; then

        cd "$_gitname" && git pull origin                || return 1
        msg "The local files are updated."

      else

        git clone "$_gitroot" "$_gitname"                || return 1
        cd "$_gitname"                                   || return 1

      fi

      msg "GIT checkout done or server timeout"

    fi

    # At this point, the current working directory
    # should be "$srcdir/$_gitname"

  #### Clean ####

    if [ $_clean ]; then

      msg "Cleaning ..."
      git clean -fdx                                     || return 1

    fi

  #### Configure ####

    if [ $_config ]; then
    
      msg "Configuring ..."

      local version_icecat="$(perl -e '`icecat -v` =~ /(\d+\.\d+[^\s.,;:]*)/; print $1')"           || return 1
      local extension_id="`perl -ne 'm[<em:id>({[^}]+})</em:id>] && print($1) && last' install.rdf`" || return 1
      local path_install="$pkgdir/usr/lib/icecat-$version_icecat/extensions/$extension_id"

    fi

  #### Compile ####

    if [ $_compile ]; then
    
      msg "Compiling ..."
      sh build.sh || return 1

    fi

  #### Install  ####

    if [ $_install ]; then
    
      msg "Installing ..."

      install -d "$path_install"      || return 1
      unzip -od "$path_install" *.xpi || return 1  # should construct the file name.

    fi
}
